package pe.com.rimac.sat.portal.util;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;

@Component
public class UtilFile {

	private static final Logger logger = LoggerFactory.getLogger(UtilFile.class);
	
	public void showFileWeb(String cadenaTraza, InputStream inputStream, String mimeType,
			String fileName, int bytesLength, HttpServletResponse response){
			
		String traza = cadenaTraza + "[showFileWeb]";
		logger.info(traza + "<---------- Inicio metodo [showFileWeb] ---------->");		
		try{
			
			logger.info(traza + "Mostrando archivo en la vista WEB");
			logger.info(traza + "Nombre archivo: " + fileName);
			logger.info(traza + "MIME Type: " + mimeType);
			logger.info(traza + "Cantidad Bytes: " + bytesLength);
			
//			String mimeTypeFinal= URLConnection.guessContentTypeFromName(fileName);
//	        if(mimeTypeFinal==null){
//	            logger.info(traza + "Mimetype no se pudo detectar. Se pondrá por defecto");
//	            mimeTypeFinal = "application/octet-stream";
//	        }	        
	        response.setContentType(mimeType);
//	        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + fileName +"\"")); 
	        response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fileName));	         
	        response.setContentLength(bytesLength);	 	       
	       
	        //Copiar bytes de la fuente al destino(outputstream en este ejemplo), al final se cierran ambos stream.
	        FileCopyUtils.copy(inputStream, response.getOutputStream());
		}catch(IOException e){
			logger.info(traza + "IOException:", e);
		}finally{
			logger.info(traza + "<---------- Fin metodo [showFileWeb] ---------->");	
		}
		
	}
}
