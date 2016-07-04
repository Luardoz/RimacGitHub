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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import pe.com.rimac.sat.portal.bean.Reclamo;
import pe.com.rimac.sat.portal.util.Properties;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	    
	@Autowired
	private Properties properties;
	
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
    
    @RequestMapping(value = "/serviceUser/reclamos-registrar", method = RequestMethod.GET)
    public String irRegReclamosPage(ModelMap model) {
    	logger.info("[irRegReclamosPage]Devolviendo vista Registrar Reclamos");           	
        return "user/reclamos/reclamos-registrar";
    }
    
    @RequestMapping(value = "/serviceUser/test", method = RequestMethod.POST)
    public String metodoTest(ModelMap model) {
    	logger.info("[metodoTest]Metodo test");           	
        return "user/reclamos/reclamos-registrar";
    }
    
    @RequestMapping(value = "/serviceUser/reclamos-registrar/nuevo", method = RequestMethod.POST)
    public String registrarReclamo(@ModelAttribute("reclamo") Reclamo  reclamo, HttpServletRequest request){
    	logger.info(reclamo.getDescdetallecaso());
    	logger.info(reclamo.getDesctitulo());
    	logger.info(reclamo.getIdfecregistro());
    	logger.info(reclamo.getIdproducto());
    	logger.info(reclamo.getIdsistema());
    	logger.info(reclamo.getIdtipocaso());
    	
    	List<MultipartFile> ficheros = reclamo.getArchivos();          
	    		   
        if(null != ficheros && ficheros.size() > 0) {      
       	
       	 for (MultipartFile fichero : ficheros) {              		     
       		 if (!fichero.isEmpty()){
       			        			 
     	    	 logger.info("getOriginalFilename: " + fichero.getOriginalFilename());
     	    	 logger.info("getContentType: " + fichero.getContentType());
     	    	 logger.info("getName: " + fichero.getName());
     	    	 
     	    	 File ficheroDestino = new File(properties.cRUTA_DESTINO_ARCHIVO + fichero.getOriginalFilename());
     	           
     	    	   	logger.info("copiando fichero en : " + properties.cRUTA_DESTINO_ARCHIVO);
     	    	   	try {
     	               fichero.transferTo(ficheroDestino);
     	    	   	} catch (IllegalStateException e) {
     	    	   		logger.error("IllegalStateException: ", e);
     	    	   		return "Error al subir el fichero: " + fichero.getOriginalFilename() ;
     	    	   	} catch (IOException e) {
     	    	   		logger.error("IOException: ", e);
     	    	   		return "Error al subir el fichero: " + fichero.getOriginalFilename() ;
     	    	   	}
     	                	   
     	    	  	    
     	         }else {
     	    	  
     	    	   return "errorSubirFichero" ;
     	       }  //fin del if 
       		
       	 }   //fin del for  
       	 return "correctoSubirFichero";  
        }else {
       	 return "errorSubirFichero" ;
        }
    	
    }
    
    @RequestMapping(value = "/serviceUser/descargarArchivo", method = RequestMethod.GET)
    public void descargarArchivo(HttpServletResponse response) throws IOException{
    	File file = null;

        file = new File(properties.cRUTA_DESTINO_ARCHIVO + "David_Guetta_Play_Hard_tone.mp3");
        logger.info("Descargando archivo " + properties.cRUTA_DESTINO_ARCHIVO + "David_Guetta_Play_Hard_tone.mp3");
        if(!file.exists()){
            String errorMessage = "Sorry. The file you are looking for does not exist";
            logger.error(errorMessage);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
            outputStream.close();
            return;
        }
         
        String mimeType= URLConnection.guessContentTypeFromName(file.getName());
        if(mimeType==null){
        	logger.error("mimetype is not detectable, will take default");
            mimeType = "application/octet-stream";
        }
         
        logger.info("mimetype : "+mimeType);
         
        response.setContentType(mimeType);
         
        /* "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser] right on browser 
            while others(zip e.g) will be directly downloaded [may provide save as popup, based on your browser setting.]*/
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() +"\""));
 
         
        /* "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your browser setting*/
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
