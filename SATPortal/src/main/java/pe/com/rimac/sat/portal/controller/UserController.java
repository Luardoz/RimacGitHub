package pe.com.rimac.sat.portal.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.service.UserService;
import pe.com.rimac.sat.portal.util.Properties;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	    
	@Autowired
	private Properties properties;
	
	@Autowired
	private UserService userService;
	
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
    	logger.info("[userPage]Devolviendo vista usuario");       
    	model.addAttribute("user", getPrincipal());
        return "user/inicio";
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-mis-reclamos", method = RequestMethod.GET)
    public String irMisReclamosPage(ModelMap model) {
    	logger.info("[irMisReclamosPage]Devolviendo vista Mis Reclamos");           	
        return "user/reclamos/reclamos-mis-reclamos";
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-registrar", method = {RequestMethod.GET, RequestMethod.POST})
    public String irRegReclamosPage(ModelMap model) {
    	String traza = "[irRegReclamosPage]";
    	logger.info(traza + "Devolviendo vista Registrar Reclamos");
    	try{
	    	Map<String, List<ComboBox>> mapCombo;
	    	mapCombo = userService.getCombosFormRegister(traza);
	    	model.addAttribute(properties.cFORM_REGISTRO_LISTA_TIPO_CASO, (List<ComboBox>)mapCombo.get(properties.cFORM_REGISTRO_LISTA_TIPO_CASO));
	    	model.addAttribute(properties.cFORM_REGISTRO_LISTA_PRODUCTO, (List<ComboBox>)mapCombo.get(properties.cFORM_REGISTRO_LISTA_PRODUCTO));
	    	model.addAttribute(properties.cFORM_REGISTRO_LISTA_SISTEMA, (List<ComboBox>)mapCombo.get(properties.cFORM_REGISTRO_LISTA_SISTEMA));	    	
    	}catch(DBException e){
    		logger.error(traza + "Ocurrio un error consultando a la BD");
    	}
        return "user/reclamos/reclamos-registrar";
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-registrar/nuevo", method = {RequestMethod.POST},  produces = { "application/json" })
    @ResponseBody
    public Response registrarReclamo(HttpServletRequest request){    	
    	Response res = new Response();
    	res.setCodResp(properties.cCODIGO_ERROR_ESTANDAR);     
	    String metodo = "[registrarReclamo]";		   
	    
    	try{
	    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	    	MultipartFile multipartFile = multipartRequest.getFile("fileBytes");	    		    		    
	    	logger.info(metodo + "fileName: " + request.getParameter("fileName"));
	    	logger.info(metodo + "idtipocaso: " + request.getParameter("idtipocaso"));
	    	logger.info(metodo + "idsistema: " + request.getParameter("idsistema"));
	    	logger.info(metodo + "idproducto: " + request.getParameter("idproducto"));
	    	logger.info(metodo + "idfecregistro: " + request.getParameter("idfecregistro"));
	    	logger.info(metodo + "desctitulo: " + request.getParameter("desctitulo"));
	    	logger.info(metodo + "descdetallecaso: " + request.getParameter("descdetallecaso"));
	    	
	    	WorkFlow bean = new WorkFlow();
	    	bean.setArchivoAdjunto(multipartFile);
	    	bean.setTitulo(request.getParameter("desctitulo"));
	    	bean.setSitemas(request.getParameter("idsistema"));
	    	bean.setDescripcion(request.getParameter("descdetallecaso"));
	    	bean.setUsuario(getPrincipal());
	    	bean.setProducto(request.getParameter("idproducto"));
	    	bean.setIdewfdef(Integer.parseInt(request.getParameter("idtipocaso")));	    		    	
	    	res = userService.saveWorkFlow(metodo, bean);	        		    		    	
    	}catch(DBException e){
    		res.setCodResp(properties.cCODIGO_ERROR_ESTANDAR);
    		res.setMsjResp("Ocurrio un error registrando el WorkFlow en la Base de Datos. Intentelo mas tarde");
    		logger.error(metodo + "Ocurrio un error en BD");
    	}
        return res;
    }
    
    @RequestMapping(value = "/serviceUser/descargarArchivo", method = RequestMethod.GET)
    public void descargarArchivo(HttpServletResponse response) throws IOException{
    	File file = null;

        file = new File(properties.cRUTA_DESTINO_ARCHIVO + "David_Guetta_Play_Hard_tone.mp3");
        logger.info("Descargando archivo " + properties.cRUTA_DESTINO_ARCHIVO + "David_Guetta_Play_Hard_tone.mp3");
        if(!file.exists()){
            String errorMessage = "Lo sentimos. El archivo que buscas no existe";
            logger.error(errorMessage);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
            outputStream.close();
            return;
        }
         
        String mimeType= URLConnection.guessContentTypeFromName(file.getName());
        if(mimeType==null){
        	logger.error("Mimetype no se puede detectar, se seleccion el mimetype por defecto (application/octet-stream) ");
            mimeType = "application/octet-stream";
        }
         
        logger.info("mimetype : "+mimeType);
         
        response.setContentType(mimeType);
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() +"\"")); 
        //response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));
         
        response.setContentLength((int)file.length());
 
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
 
        //Copy bytes from source to destination(outputstream in this example), closes both streams.
        FileCopyUtils.copy(inputStream, response.getOutputStream());
    }
    
    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }
}
