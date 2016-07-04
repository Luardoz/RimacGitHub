/*
$(function() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	console.log(header + ': ' + token);
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});
*/
function aniadirFilaAdjunto(){
	 var identificador = "filaAdjunto";
	 var fileIndex;  
	 var cantFila = $('#tablaficheros tr').length;
	 if(cantFila > 0){
		 fileIndex = Number($('#tablaficheros tr:last').attr("id").substring(identificador.length)) + 1;  
	 }else{
		 fileIndex = 0;  
	 }
	 
     $('#tablaficheros').append(               
               '<tr id="'+ identificador + fileIndex+'"><td style="padding: 10px 0px 0px 0px;">'+        
                '   <input type="file" class="form-control" id="archivos['+ fileIndex +']" name="archivos['+ fileIndex +']" />'+  
                '</td>'+
                '<td style="padding: 10px 0px 0px 10px;">' +
                '<input type="button" value="Borrar" onclick="borraFilaAdjunto(filaAdjunto'+fileIndex+');">' +
                '</td>'+
                '</tr>');     
}

function borraFilaAdjunto(idFila){
	$(idFila).remove();

}

function registrarReclamo(){
	console.log('Entrando en registro de reclamo');
	$("#form-reclamos-registrar").submit();
}

