  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div class="panel-body" id="registro-reclamo-container">
  <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
					<h4 style="margin: 0px;">Detalle del Ticket</h4>
					<hr style="margin: 0px; border-color: #dddddd;">	            
  </div> 
  <br>
  <br>
  <%-- <c:url var="post_url"  value="/serviceUser/reclamos-registrar/nuevo" /> --%>
  <form:form action="serviceUser/reclamos-registrar/nuevo?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" id="form-reclamos-registrar" method="post" modelAttribute="reclamo">
  <%-- <form:form action="serviceUser/test" id="form-reclamos-registrar" method="post"> --%>
    <div class="form-group">
        <label class="control-label col-xs-3  required">Tipo de Caso:</label>
        <div class="col-xs-5">
         <select class="selectpicker form-control" id="idtipocaso" name="idtipocaso">
         </select>
          <div class="result"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3 required">Sistema:</label>
        <div class="col-xs-5">
         <select class="selectpicker form-control" id="idsistema" name="idsistema">
         </select>
          <div class="result"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3 required">Producto:</label>
        <div class="col-xs-5">
         <select class="selectpicker form-control" id="idproducto" name="idproducto">
         </select>
          <div class="result"></div>
        </div>
    </div>
    <div id="fecregistro" class="form-group" style="display: none">
        <label class="control-label col-xs-3">Fecha de Registro:</label>
        <div class="col-xs-5">
                    	<div id="divfecha" class="input-group">
                        <input type="text" id="idfecregistro"  name="idfecregistro" class="form-control" readonly="readonly">
						<span class="input-group-addon">
							<a id="btnFechaRegistro" class="btn-date">
                            	<span class="glyphicon glyphicon-calendar"></span>
                            </a>											                                          
                        </span>
                    	<div class="result"></div>										
						</div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3 required">Titulo:</label>
        <div class="col-xs-9">
            <input type="text" class="form-control" id="desctitulo" name="desctitulo">
             <div class="result"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3 required">Detalle del Caso:</label>
        <div class="col-xs-9">
            <textarea rows="6" class="form-control" id="descdetallecaso" name="descdetallecaso" style="resize: none "></textarea>
             <div class="result"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3">Adjuntar Archivo:</label>
        <div class="col-xs-9">
            <input type="button" id="aniadirArchivo" name="aniadirArchivo" value="Adicionar adjunto" onclick="aniadirFilaAdjunto();">
            <table id="tablaficheros"> 	        
	        </table> 
         </div>
         
    </div>
    
    <br>
    <br>
    <br>
    <div>
     <span>
     (<label class="required"></label>)Campos Obligatorios
      </span>
<!--      <label class="control-label col-xs-3">Campos Obligatorios</label> -->
    </div>
    <div class="form-group" align="right">
        <div class="col-xs-offset-3 col-xs-9">
           <a class='btn btn-primary' onclick='registrarReclamo();' id='linkRegistrar'>Registrar</a>
        </div>
    </div>
    </form:form>
    
    <a class='btn btn-primary' target="_blank" href="serviceUser/descargarArchivo" id='linkDescarga'>Descargar</a>
</div>

<!--
<script type="text/javascript">
	
// 	var fecha   = new Date();
// 	var dia_mes =fecha.getDate();
// 	var mes     =fecha.getMonth()+1;
// 	var año     =fecha.getFullYear();
// 	var hora    =fecha.getHours();
// 	var minutos =fecha.getMinutes();
// 	var segundos=fecha.getSeconds();

// 	if (mes < 10) {
// 	   mes = '0' + mes;
// 	}
// 	if (dia_mes < 10) {
// 	   dia_mes = '0' + dia_mes;
// 	}
// 	var fechaactual=dia_mes+'/'+mes+'/'+año+'  '+hora+':'+minutos+':'+segundos;
// 	$('#idfecregistro').val(fechaactual);
    lstTipoCaso();
    lstProducto();
    lstSistema();
    
	$("#form-reclamos-registrar").validate({
		rules : {
			idtipocaso	    : { required  : true },
			idsistema       : { required  : true },
			idproducto 	    : { required  : true },
			desctitulo 	    : { required  : true },
			descdetallecaso : { required  : true }
		},
		messages : {
			idtipocaso 	    : { required  : "Seleccionar Tipo de Caso"},
			idsistema 	    : { required  : "Seleccionar Sistema"},
			idproducto 	    : { required  : "Seleccionar Producto"},
			desctitulo	    : { required  : "Ingresar Titulo"},
			descdetallecaso : { required  : "Ingresar Detalle de Caso"}
		}
	});	
	
function registrar_reclamo() {
	var $inputs = $('#form-reclamos-registrar :input');
	$inputs.each(function() {
		if(this.id!=""){
			if($("#form-reclamos-registrar #"+ this.id).valid())
				$(".result", $("#"+this.id).parent()).html("<i class='success'></i>");			
			else
				$(".result", $("#"+this.id).parent()).html("<i class='error'></i>");
		}
	});

	if($("#form-reclamos-registrar").valid()){
	
	var param = new Object();
	param.idetipocaso	    =$("#form-reclamos-registrar #idtipocaso").val();
	param.idesistema	    =$("#form-reclamos-registrar #idsistema").val();
	param.ideproducto	    =$("#form-reclamos-registrar #idproducto").val();
	param.desctitulo		=$("#form-reclamos-registrar #desctitulo").val();
	param.descdetallecaso	=$("#form-reclamos-registrar #descdetallecaso").val();
	param.archivo1      	=$("#form-reclamos-registrar #archivo1").val();
	param.usucreacion       =CTE_USUARIO;
	
	loadModalCargando();
	setTimeout(
			  function(){
					$.ajax({
						type 		: "POST",
						url 		: "/WORKFLOW/mntwf.do?method=mntReclamo",
						cache 		: false ,
						dataType	: "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						async 		: false,
						data 		: param,
						success 	: function(rsp){
											var status 	= rsp.statustx;
											var message = rsp.messagetx;
											closeModalCargando();
											if(status == 0){
												loadModalMensaje("Felicitaciones", message, function(){$("#modalRegistro").modal('hide');});
												//[INI] KCARRANZAP - 10/08/2015
												dataLayer.push({'event': 'RegisterSuccess', 'RegisterID': $("#form-registro-cliente #numerodoc").val()});
												//[FIN] KCARRANZAP - 10/08/2015
												limpiarFormulario('form-registro-cliente');
											}else
												loadModalMensaje("Atención",message,null);
						},						
						error: function (rsp, xhr, ajaxOptions, thrownError) {
							closeModalCargando();
							loadModalMensaje("Error","ERROR REGISTRANDO RECLAMO",null);
						}			
					});		    					    				
				},1000);  
	}
}

function lstTipoCaso(){
	var param 		  = new Object();
	$.ajax({
		type  		: "POST",
		url   		: "/WORKFLOW/mntwf.do?method=cmbTipoCaso",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data		: {datos:JSON.stringify(param)},
		success 	: function(data) {
					if (data != 'undefined'){
					    var jsonReclamos = eval(data.lsttipocaso);
						llenarCombo('idtipocaso', jsonReclamos, true);
					};
		},
		error : function(xhr, ajaxOptions, thrownError) {
			loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
		}
	});
}

function lstProducto(){
	var param 		  = new Object();
	param.ideatributo =1780;
	$.ajax({
		type  		: "POST",
		url   		: "/WORKFLOW/mntwf.do?method=cmbProducto",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data		: param,
		success 	: function(data) {
					if (data != 'undefined'){
					    var jsonReclamos = eval(data.lstproducto);
						llenarCombo('idproducto', jsonReclamos, true);
					};
		},
		error : function(xhr, ajaxOptions, thrownError) {
			loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
		}
	});
}

function lstSistema(){
	var param 		  = new Object();
	param.idetippar   ='RTC_PARAPLICACIONRIMAC';
	$.ajax({
		type  		: "POST",
		url   		: "/REQUERIMIENTO/util.do?method=listaParametro",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data		: param,
		success 	: function(data) {
					if (data != 'undefined'){
					    var jsonReclamos = eval(data);
						llenarCombo('idsistema', jsonReclamos, true);
					};
		},
		error : function(xhr, ajaxOptions, thrownError) {
			loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
		}
	});
}

function llenarCombo(idControl,listaOpciones,emptyElement){
	
	var combo = $('#'+idControl);
	combo.empty();
	if(emptyElement)
		combo.append('<option value="">'+'Seleccionar'+'</option>');
	for(var i=0; i<listaOpciones.length; i++){
		if(listaOpciones[i][1] != "NO DETERMINADO"){
			var opcion = '<option value="'+listaOpciones[i][0]+'" >'+listaOpciones[i][1]+'</option>' ;
			combo.append(opcion);
		}
	}
	$('#'+idControl).change();
}
-->
</script>


