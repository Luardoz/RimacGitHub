package pe.com.rimac.sat.portal.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Incidente;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.Tarea;
import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.service.UserService;
import pe.com.rimac.sat.portal.util.Properties;
import pe.com.rimac.sat.portal.util.UtilFile;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	    
	@Autowired
	private Properties properties;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UtilFile utilFile;
	
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model, HttpSession session) {
    	UsuarioRimac user = (UsuarioRimac) session.getAttribute("user");    	
    	logger.info("[userPage]Devolviendo vista usuario. Usuario: " + user.getIdUsuario());       
    	model.addAttribute("user", user.getIdUsuario());
    	model.addAttribute("nombre", user.getNomTer());
        return "user/inicio";
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-mis-reclamos", method = RequestMethod.GET)
    public String irMisReclamosPage(ModelMap model) {
    	String traza = "[irMisReclamosPage]";
    	logger.info(traza + "Devolviendo vista Mis Reclamos");
    	try{
    		model.addAttribute("lstEstado", userService.getComboEstado(traza));
    	}catch(DBException e){
    		logger.error(traza + "Ocurrio un error consultando a la BD");
    	}
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
    		UsuarioRimac user = (UsuarioRimac) request.getSession().getAttribute("user");    
    		
	    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	    	MultipartFile multipartFile = multipartRequest.getFile("fileBytes");	    		    		    
	    	logger.info(metodo + "fileName: " + multipartFile.getOriginalFilename());
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
	    	bean.setUsuario(user.getIdUsuario());
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
    
    @RequestMapping(value = "/serviceUser/reclamos-mis-reclamos/listar", method = {RequestMethod.POST},  produces = { "application/json" })
    @ResponseBody
//    public List<Incidente> listarWorkFlow(@RequestHeader("codUsu") String codUsu,
//    		@RequestHeader("estado") String estado, @RequestHeader("ticket") String ticket){    	
    public List<Incidente> listarWorkFlow(@RequestParam("codUsu") String codUsu,
    		@RequestParam("estado") String estado, @RequestParam("ticket") String ticket){    	    	
    	List<Incidente> res = new ArrayList<Incidente>();    	   
	    String traza = "[listarWorkFlow]";		   
	    
    	try{	    	
	    	logger.info(traza + "codUsu: " + codUsu);
	    	logger.info(traza + "estado: " + estado);	 
	    	logger.info(traza + "ticket: " + ticket);	 
	    	
	    	Integer idestado = estado.equals("") ? null: Integer.parseInt(estado);
	    	Integer idewf = ticket.equals("") ? null: Integer.parseInt(ticket);
	    	
	    	res = userService.getIncidenteList(traza, codUsu, idestado, idewf);	        		    		    	
    	}catch(DBException e){
    		res.clear();    		
    		logger.error(traza + "Ocurrio un error en BD");
    	}finally{
    		
    	}
    	
        return res;
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-mis-reclamos/tareas", method = {RequestMethod.GET},  produces = { "application/json" })
    @ResponseBody
    public List<Tarea> listarTareas(@RequestHeader("idewf") int ideWf, HttpServletRequest request){    	
    	List<Tarea> res = new ArrayList<Tarea>();    	   
	    String traza = "[listarWorkFlow]";		   
	    
    	try{	    	
	    	logger.info(traza + "idewf: " + ideWf);	    		    			    
	    	res = userService.getTareas(traza, ideWf);	        		    		    	
    	}catch(DBException e){
    		res.clear();    		
    		logger.error(traza + "Ocurrio un error en BD");
    	}finally{
    		
    	}
    	
        return res;
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-mis-reclamos/tareas/descargarArchivo", method = RequestMethod.GET)
    public void descargarArchivo(@RequestParam("idarchivo") int idArchivo, HttpServletResponse response) throws IOException{
    	
    	Map<String, Object> resDB = new HashMap<String, Object>();
    	String traza = "[descargarArchivo]";
    	try{
    		resDB = userService.getArchivoTarea(traza, idArchivo);
    		
    		if(!resDB.isEmpty()){
    			InputStream inputStream = (InputStream) resDB.get("inputStream");
    			String mimeType = String.valueOf(resDB.get("mimeType"));
    			String fileName = String.valueOf(resDB.get("nombreArchivo"));
    			int bytesLength = Integer.parseInt(resDB.get("bytesLength")+"");
    			
    			utilFile.showFileWeb(traza, inputStream, mimeType, fileName, bytesLength, response);
    		}else{
    			String errorMessage = "Lo sentimos. El archivo que buscas no existe";
                logger.error(errorMessage);
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
                outputStream.close();
    		}
    	}catch(DBException e){
    		logger.error(traza + "Ocurrió un error en Base de Datos");
    	}               
    }
}
