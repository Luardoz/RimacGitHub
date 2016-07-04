<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% 	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");%>
<%-- <%@include file="/jsp/reclamos/reclamos-detalle.jsp"%> --%>
<%@include file="reclamos-registrar.jsp"%>
<script >
	//alert("before");
</script>
<%@include file="reclamos-tareas_t.jsp"%>  
<script >
	//alert("after");
</script>
<div id="mis-reclamos" class="reclamos">
	<h3>Hola <span class="js-breadcump-nombreTitular"></span></h3>
	
	<p class="page-info-wc">
	A continuación te mostraremos los tickets que has ingresado hasta la fecha. Te informamos que de acuerdo a la normativa de la SBS, el tiempo de atención es de 30 días calendario; sin embargo, trata de enviar una respuesta en el menor tiempo posible.
    </p>
	
	<div class="form-mis-reclamos" id="frmMisReclamos">		
		<div class="group-table-reclamos" id="div-misreclamos">
		</div>
		<br> 
		    
        <div class="row visible-xs-block">
        	<div class="col-md-12">        	    
	            <div class="panel panel-default" style="margin-bottom: 10px;"> 
		        	<div class="list-group"  id="res-misreclamos">
		        	</div>
	            </div>
	            <input value="Historial de solicitudes" type="button" class="method-ajax btn btn-default" onclick="javascript:historialSol();">
			</div>
        </div>
		
		
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-12">
				<p class="bg-info">
					<small>
						NOTA: La información que se muestra en "Mis Reclamos" es actualizada cada 24 horas.
					</small>
				</p>
			</div>
		</div>
	</div>
</div>

<div id="sin-reclamos" style="display:none;">
	<h3>Hola <span class="js-breadcump-nombreTitular"></span>,</h3>
	<p class="page-info-wc">
    A la fecha no tenemos ningún reclamo asociado a tu nombre.

    <p class="container-etiqueda-label">
		Si desea registrar un nuevo reclamo haga clic 		
		<span class="label label-danger label-default-dash">
			<a id='btn-reclamo-link' class='js-mis-seguros method-ajax' href='../portalweb.do?method=goReclamos'>AQUÍ</a>			
		</span>
	</p>
</div>

<script>
	$(document).ready(function() {
		//alert("a");
		loadModalCargando();
// 		$("#Paso0Rec").hide();

		$("#registro-reclamo-container").hide();

		$("#tareas-reclamo-container").hide();

		$(".js-breadcump-nombreTitular").text(CTE_USUARIO);
		
		var pageUrl = VP_GO_RECLAMO;
		dataLayer.push({'event': EV_VIRTUAL_PAGE, 'pageUrl': pageUrl});
		var nomTablaReclamos	= 'misreclamos';
		
		traerJsonCompletoMisReclamos(nomTablaReclamos);
		
		closeModalCargando();
	});

	function traerJsonCompletoMisReclamos(nametable){
		
		var param 		  = new Object();
		param.numdoccliente  = $("#form-datos-cliente #numerodoc").val();
// 		if(CTE_JSON_PERSONAPWEB){
// 			param.tipodoccliente  = CTE_JSON_PERSONAPWEB.idptipodocumento;	
// 		}
		
// 		obtenerTipoDocExterno(CTE_JSON_PERSONAPWEB.idptipodocumento);
// 		param.tipodoccliente  = V_TIPO_DOC_EXTERNO;
		param.a_codusu = CTE_USUARIO; 
		$.ajax({
			type  		: "POST",
// 			url   		: "/ASISTENCIA/reclamo.do?method=consultarReclamosCliente",
			url   		: "/WORKFLOW/mntwf.do?method=consultarIncidentes",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data) {
// 						if (data.resultado == 0 && data.lstReclamos){
						if (data != 'undefined'){
// 							var jsonReclamos = eval(data.lstReclamos);
							var jsonReclamos = eval(data.incidentes);
							tablashtml(jsonReclamos, nametable);
// 							armarResponsive(jsonReclamos, nametable);
						}else{
							closeModalCargando();
							$("#mis-reclamos").hide();
							$("#sin-reclamos").show();
						};
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});
	}
	
	function tablashtml(jReclamos, name){
		var cadenaTablas = 	'    <div class="row visible-md-block visible-sm-block visible-lg-block">'+
						    '        <div class="table-responsive col-md-12">'+
						    '            <table id="table-'+name+'" class="table table-hover table-bordered table-inter text-center">'+
						    '                <thead>'+
						    '                    <tr>'+
							'                        <th class="text-center">N°</th>'+
						    '                        <th class="text-center">Título</th>'+
						    '                        <th class="text-center">Fecha Registro</th>'+
						    '                        <th class="text-center">Fecha Atención</th>'+
						    '                        <th class="text-center">Fecha Cierre</th>'+
						    '                        <th class="text-center">Estado</th>'+
						    '                        <th class="text-center">Tipo</th>'+
						    '                        <th class="text-center">Tareas</th>'+
						    '                    </tr>'+
						    '                </thead>'+
						    '                <tbody class="vcenter">'+
						    '                </tbody>'+
						    '            </table>'+
						    '		 <br>'+
						    '		 <div class="row" id="FilaBotones">'+
					        '    	 	<div class="col-md-12">'+
					        '    		</div>'+
				        	'		 </div>'+
						    '        </div>'+
						    '   </div>';
	
		$("#div-"+name).append(cadenaTablas);

		var idTabla= '#table-'+name;
		$(idTabla).DataTable({
			"data"      : jReclamos,
			"ordering"  : false,
	        "searching" : true,
	        "paging"    : true,
	        "bInfo"		: false,
	        "bAutoWidth": false,
	        "pagingType": "full_numbers" , 	  		
	        "columns"   : [	
// 		                   	 { "data"        : "numreclamo" ,"render" : function (data, type, full){
// 													   var a ='<a data-toggle="modal" class="btn btn-link pull-top" href="#"  onclick="javascript:setDataDetalle('
// 						 							   +full.idewf+');" id="detalle_'+full.idewf+'">'+full.idewf+'</a>'+
// 													   '<p id="idewf" name="idewf">'+full.idewf+'</p>'+
// 													   '<p id="desctarea" name="desctarea" style="display:none">'+full.desctarea+'</p>'+
// 													   '<p id="fecusu" name="fecusu" style="display:none">'+full.fecusu+'</p>'+
// 													   '<p id="fecatencion" name="fecatencion" style="display:none">'+full.fecatencion+'</p>'+
// 													   '<p id="descestado" name="descestado" style="display:none">'+full.descestado+'</p>';
// 												alert(a);
// 												return a;},"sWidth": "15%"
// 		                     }
		                   	 
		                   	 
		                   	 { "data"        : "marca" , "render" : function (data, type, full){
/*								var a ='<a data-toggle="modal" class="btn btn-link pull-top" href="#"  onclick="javascript:setDataDetalle('
		 							   +full.idewf+');" id="detalle_'+full.idewf+'">'+full.idewf+'</a>'+
*/		 							   
 						var a ='<p id="detalle_'+full.idewf+'">'+full.idewf+'</p>'+		 							   
									   '<p id="desctarea" name="desctarea" style="display:none">'+full.desctarea+'</p>'+
									   '<p id="fecusu" name="fecusu" style="display:none">'+full.fecusu+'</p>'+
									   '<p id="fecatencion" name="fecatencion" style="display:none">'+full.fecatencion+'</p>'+
									   '<p id="feccierre" name="feccierre" style="display:none">'+full.fecatencion+'</p>'+
									   '<p id="descestado" name="descestado" style="display:none">'+full.descestado+'</p>' ; 
								return a;},"sWidth": "15%"
             				},
             				{ "data"        : "desctarea","sWidth": "15%"},
             				{ "data"        : "fecusu","sWidth": "15%"},
             				{ "data"        : "fecatencion","sWidth": "15%"},
             				{ "data"        : "feccierre","sWidth": "15%"},
             				{ "data"        : "descestado","sWidth": "15%"},
             				{ "data"        : "desctipoinci","sWidth": "15%"}
             				//,{ "data"        : "idetarea","sWidth": "15%"}
             				,{ "data"        : "" ,"render" : function (data, type, full){
												var a ='<a data-toggle="modal" onclick="javascript:buscarTareas('
						 							   +full.idetarea+');" id="'+full.idetarea+'"><IMG SRC="../img/default/detach.png" WIDTH="20px" HEIGHT="20px" BORDER=0 ALIGN="CENTER"> </a>';       
												return a;},"sWidth": "15%"}
// 		                     { "data"        : "ano","sWidth": "20%"},
// 		                     { "data"        : "placa","sWidth": "20%"},
// 		                     { "render" 	 : function (data, type, full){
// 														if (type == 'display'){
// 															return cantidadSRV(full);
// 														}
// 												},
// 												"sWidth": "20%"
// 			                 },
		                   	 
// 		                   	 ,
// 		                     { "data"        : "descproducto","render": function (data,type,full){
// 		                    	 				return full.descproducto == "" ? C_NO_DISPONIBLE : full.descproducto;
// 		                     },"sWidth": "20%"},
// 		                     { "data"        : "fecocureclamo","render": function (data,type,full){
//             	 								return full.fecocureclamo == "" ? C_NO_DISPONIBLE : full.fecocureclamo;
//              				 },"sWidth": "15%"},
// 		                     { "data"        : "estadoreclamo" ,"render" : function (data, type, full){
// 		                    	 					var a = obtenerEstado(full.estadoreclamo);
// 		                     					return a;},"sWidth": "25%"},
		                     //{ "data"        : "fecregreclamo","sWidth": "20%"},
		                     //{ "data"        : "numhojareclamo","sWidth": "20%"},
		                     /*
		                   	 { "data"        : "" ,"render" : function (data, type, full){
									var a ='<a data-toggle="modal" class="btn btn-link" href="#" data-target="#reclamos-descargar" onclick="javascript:setFormDescargar('
			 							   +full.numreclamo+');" id="descargar_'+full.numreclamo+'"><i class="i-digital"></i></a>';
									return a;},"sWidth": "20%"
              },*/
	                    ],
	        "fnDrawCallback": function () {
		        		var table = $(idTabla).dataTable();
		        		if(table.fnGetData().length ==0){
		        		   table.parent().toggle(false);
		        		   $("#idmensajeH6").text("El sistema no encontró Reclamos asociados al DNI.");
		           		   $("#FilaBotones").hide();
		        		}
	        }
	     });
	}
	
	function armarResponsive(json, nametable){
		
		var cadenaFilas="";		
		for(var f=0; f<json.length; f++){
			var dscproducto,fecocureclamo = '';
			dscproducto   = json[f].descproducto == "" ? C_NO_DISPONIBLE : json[f].descproducto;
			fecocureclamo = json[f].fecocureclamo == "" ? C_NO_DISPONIBLE : json[f].fecocureclamo;
			cadenaFilas = '<a onclick="javascript:setDataDetalle(\''+json[f].numreclamo+'\');" class="method-ajax list-group-item">'+
							'<dl><dt><label>Reclamo</label></dt><dd><label>: '+json[f].numreclamo +'</label></dd></dl>'+
							'<dl><dt><label>Producto</label></dt><dd><label>: '+dscproducto +'</label></dd></dl>'+
							'<dl><dt><label>Fecha</label></dt><dd><label>: '+fecocureclamo +'</label></dd></dl>'+
							'<dl><dt><label>Estado</label></dt><dd><label>: '+obtenerEstado(json[f].estadoreclamo);+'</label></dd></dl>'+
							//'<dl><dt><label>Documentos:</label></dt><dd><i class="i-digital"></i></dd></dl>'+
					      '</a>';
			$("#res-"+nametable).append(cadenaFilas);
			marca = "";
		}
	}

	function obtenerTipoDocExterno(value){
		var param 		  = new Object();
		param.codigoc = value;
		$.ajax({
			type  		: "POST",
			url   		: "/ASISTENCIA/reclamo.do?method=obtTipoDocExt",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(rsp) {
				var respuesta = eval(rsp);
				V_TIPO_DOC_EXTERNO = respuesta.codexterno;
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});
	}
	
	function obtenerTipoDocInterno(value){
		var param 		  = new Object();
		param.codexterno = value;
		$.ajax({
			type  		: "POST",
			url   		: "/ASISTENCIA/reclamo.do?method=obtTipoDocByExt",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(rsp) {
				var respuesta = eval(rsp);
				V_TIPO_DOC_INTERNO = respuesta.codigoc;
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});
	}
	
	function buscarTareas(value){
		alert("value " + value);
		var param = new Object();		
		param.idewf = String(value);
		
		loadModalCargando();
		
		$.ajax({
			url 		: "/WORKFLOW/mntwf.do?method=consultarIncidentesDetalle",
			cache 		: false ,
			dataType	: "json",
			contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
			data 		: {datos:JSON.stringify(param)},			
			async 		: false ,
			success 	: function(rsp) {

				var rpta = eval(rsp);
			    var obj = JSON.parse(rpta.incidentes);
			    llenarDatosConsulta(obj);
				
			    $("#mis-reclamos").hide();
				$("#tareas-reclamo-container").show();
			    
			},
			error		: function (rsp, xhr, ajaxOptions, thrownError) {}
		});	
		
		closeModalCargando();
		
	}
	
	function setDataDetalle(value){
		var param = new Object();		
		param.idewf = String(value);
		
		loadModalCargando();
		
		$.ajax({
			url 		: "/WORKFLOW/mntwf.do?method=consultarIncidentesDetalle",
			cache 		: false ,
			dataType	: "json",
			contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
			data 		: {datos:JSON.stringify(param)},			
			async 		: false ,
			success 	: function(rsp) {

				var rpta = eval(rsp);
			    var obj = JSON.parse(rpta.incidentes);
			    llenarDatosConsulta(obj);
				
			    $("#mis-reclamos").hide();
				$("#registro-reclamo-container").show();
			    
// 				$("#mis-reclamos").hide();
// 				$("#Paso0Rec").hide();
// 				$("#Paso1Rec").show();
// 				$("#Paso2Rec").show();

// 				$("#Paso1Rec :input").attr("disabled", true);
// 				$("#Paso2Rec :input").attr("disabled", true);
							},
			error		: function (rsp, xhr, ajaxOptions, thrownError) {}
		});	
		
		closeModalCargando();
	}

	function setFormDescargar(value){		
		var param 		  = new Object();
		param.numcasopiv = value;
		
		$("#checkDocs").empty();
		
		$.ajax({
			type  		: "POST",
			url   		: "/ASISTENCIA/reclamo.do?method=obtenerDctosReclamo",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data) {
						try{
							var jsonDoc = eval(data);
							
							var inicio = "<div><label>";
							var fin = "</label></div>";
							var checkHojaReclamo = "";
							var checkConstanciaReclamo = "";
							var checkRptaReclamo = "";
							var checks = "";
							
							if (jsonDoc.urlhojareclamo != ""){
								checkHojaReclamo = inicio;
								checkHojaReclamo = checkHojaReclamo + '<input type="checkbox" id="hojaReclamo" name="hojaReclamo">Hoja de Reclamacion';
								checkHojaReclamo = checkHojaReclamo + fin;
								RUTA_HOJA_RECLAMO = jsonDoc.urlhojareclamo;
							}
							if (jsonDoc.urlcartaampliacion != ""){
								checkConstanciaReclamo = inicio;
								checkConstanciaReclamo = checkConstanciaReclamo + '<input type="checkbox" id="constanciaReclamo" name="constanciaReclamo">Constancia de Reclamo';
								checkConstanciaReclamo = checkConstanciaReclamo + fin;
								RUTA_CONSTANCIA_RECLAMO = jsonDoc.urlcartaampliacion;
							}
							if (jsonDoc.urlcartarptareclamo != ""){
								checkRptaReclamo = inicio;
								checkRptaReclamo = checkRptaReclamo + '<input type="checkbox" id="rptaReclamo" name="rptaReclamo">Respuesta de Reclamo';
								checkRptaReclamo = checkRptaReclamo + fin;
								RUTA_RESPUESTA_RECLAMO = jsonDoc.urlcartarptareclamo;
							}
							checks = checkHojaReclamo + checkConstanciaReclamo + checkRptaReclamo;
							
							$("#checkDocs").append(checks);
						}catch(err){
							closeModalCargando();
							loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
						}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});
	}
	
	function setearCombos(){
		obtenerComboParametrosOperaciones('operaciondsc', CTE_PWEB_REC_OPERACIONES);
		obtenerCombosParametros('tipoprovnoreg',CTE_PWEB_REC_TIPO_PROV_NO_REG);
		obtenerCombosParametros('motivodsc',CTE_PWEB_REC_MOTIVOS);
		//obtenerCombosParametros('tipodereclamo',CTE_PWEB_REC_TIPRECLAMO);
		obtenerCombosParametros('entidadbancaria',CTE_PWEB_REC_ENTBANCARIA);
		obtenerCombosParametros('tipocuenta',CTE_PWEB_REC_TIPCTABANCARIA);
		obtenerCombosParametros('tipomoneda',CTE_PWEB_REC_MONEDAS);
		obtenerCombosParametros('tipodoc_reclamante',CTE_PWEB_REC_TIPDOC);			
		obtenerCombosParametros('tipovia',CTE_PWEB_REC_TIPOVIA);
		obtenerCombosParametros('via',CTE_PWEB_REC_VIA);
		obtenerCombosParametros('tipointerior',CTE_PWEB_REC_TIPOINTERIOR);
		obtenerCombosParametros('estadoreclamo','PWEB_REC_STS');
		
		//cargarComboSexo();
		//obtenerDisclaimers();
	}
	
	function obtenerCombosTipoCaso(){
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
	
	function cargarComboSexo(){
		$("#sexorec").append('<option value="">Seleccionar</option>');
		$("#sexorec").append('<option value="M">M</option>');
		$("#sexorec").append('<option value="F">F</option>');
	}
	
	
	function obtenerCombosParametros(input,parametro){
		var param = new Object();
		param.idetippar = parametro;
		if(parametro == CTE_PWEB_REC_OPERACIONES){
			param.idetipparpadre = CTE_PWEB_REC_OPERACIONES;	
		}
		
		$.ajax({
			type  		: "POST",
			url   		: SERVICIO_ASISTENCIA_RECLAMO+'?method=obtenerValoresCombos',
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data){
							$("#"+input).append("<option value=''>"+ C_NO_DISPONIBLE +"</option>");
							for(var i=0; i<data.length; i++ ){
								$("#"+input).append("<option value='"+data[i].codigo+"'>"+data[i].descripcion+"</option>");
							}
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
	}
	
	function obtenerCombosParametros(input,parametro){
		var param = new Object();
		param.idetippar = parametro;
		if(parametro == CTE_PWEB_REC_OPERACIONES){
			param.idetipparpadre = CTE_PWEB_REC_OPERACIONES;	
		}
		
		$.ajax({
			type  		: "POST",
			url   		: SERVICIO_ASISTENCIA_RECLAMO+'?method=obtenerValoresCombos',
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data){
							$("#"+input).append("<option value=''>"+ C_NO_DISPONIBLE +"</option>");
							for(var i=0; i<data.length; i++ ){
								$("#"+input).append("<option value='"+data[i].codigo+"'>"+data[i].descripcion+"</option>");
							}
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
	}
	
	function obtenerComboParametrosOperaciones(input,parametro){
		var param = new Object();
		param.idetipparpadre = CTE_PWEB_REC_OPERACIONES;	
		
		$.ajax({
			type  		: "POST",
			url   		: SERVICIO_ASISTENCIA_RECLAMO+'?method=obtenerValoresComboOperaciones',
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data){
							$("#"+input).append("<option value=''>"+ C_NO_DISPONIBLE +"</option>");
							for(var i=0; i<data.length; i++ ){
								$("#"+input).append("<option value='"+data[i].codigo+"'>"+data[i].descripcion+"</option>");
							}
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
	}
	
	function obtenerEstado(value){
		
		var desc = "";
		var param 		  = new Object();
		param.codigoc = value;
		param.codigo = value;
		param.idetippar = "PWEB_REC_STS";
		param.indactivo = CTE_SI;
		$.ajax({
			type  		: "POST",
			url   		: "/ASISTENCIA/reclamo.do?method=obtenerParametro",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data) {
							var jsonReclamos = eval(data);
							desc =  jsonReclamos.descripcion;
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});
		
		return desc;
	}
	
	function descargar(){
		var urlDescarga = "";
		
		if($('#hojaReclamo').prop('checked')){
			urlDescarga = RUTA_HOJA_RECLAMO;
		}
		if($('#constanciaReclamo').prop('checked')){
			urlDescarga = RUTA_CONSTANCIA_RECLAMO;
		}
		if($('#rptaReclamo').prop('checked')){
			urlDescarga = RUTA_RESPUESTA_RECLAMO;
		}
	}
	
	function llenarDatosConsulta(data){
// 		obtenerDireccionContacto(data);
// 		obtenerDireccionOcurrencia(data);
// 		setearCombos();
		
//     	obtenerTipoDocInterno(data.tipodoccontacto);
		
		$("#idtipocaso").val(data.idewfdef);
		$("#idsistema").val(data.idpaplicacion);
		$("#fecregistro").css("display", "block");
		$("#idfecregistro").val(data.fecusu);
		$("#desctitulo").val(data.titulo);
		$("#descdetallecaso").val(data.descripcion);
		$("#dscarchivo").css("display", "block");
		$("#dscarchivo").val(data.nomarchivo);
		$("#linkRegistrar").text('Actualizar');
		
// 		$("#tipodoc_reclamante").val(V_TIPO_DOC_INTERNO);
// 		$("#numdoc_reclamante").val(data.numdoccontacto);
		
// 	   	if(CTE_JSON_PERSONAPWEB){
// 			if(CTE_JSON_PERSONAPWEB.idptipodocumento == V_TIPO_DOC_INTERNO && CTE_NUM_DOC == data.numdoccontacto){
// 	    		if(CTE_JSON_PERSONAPWEB.apepaterno != ""){
// 	    			$('#appatreclamante').val(CTE_JSON_PERSONAPWEB.apepaterno);
// 	    		}
// 	    		if(CTE_JSON_PERSONAPWEB.apematerno != ""){
// 	    			$('#apmatreclamante').val(CTE_JSON_PERSONAPWEB.apematerno);
// 	    		}
// 	    		if(CTE_JSON_PERSONAPWEB.nombre != ""){
// 	    			$('#nombrereclamante').val(CTE_JSON_PERSONAPWEB.nombre);
// 	    		}
// 	    		if(CTE_JSON_PERSONAPWEB.idpgenero != ""){
// 	    			$('#sexorec').val(CTE_JSON_PERSONAPWEB.idpgenero);
// 	    		}
// 	    		if(CTE_JSON_PERSONAPWEB.fecnacimiento != ""){
// 	    			$('#fec_nacim').val(CTE_JSON_PERSONAPWEB.fecnacimiento);
// 	    		}
// 	    	}
// 		}else{
// 				obtenerDatosxNumDoc(data.numdoccontacto);
// 		}
		
		
//     	//Hoja Paso1
//     	//Seteando valores provenientes del servicio
//     	if(data.urbcontacto){
//     		$("#tipozona").val(data.urbcontacto);	
//     	}else{
//     		$("#tipozona").val(C_NO_DISPONIBLE);
//     	}
//    		$("#tipovia").val(data.dircontacto);	
//     	if(data.dircontactodet){
//     		$("#nomvia").val(data.dircontactodet);	
//     	}else{
//     		$("#nomvia").val(C_NO_DISPONIBLE);
//     	}
//    		$("#via").val(data.nrodircontacto);	
//     	if(data.nrodircontactodet){
//     		$("#nrovia").val(data.nrodircontactodet);	
//     	}else{
//     		$("#nrovia").val(C_NO_DISPONIBLE);
//     	}
//    		$("#tipointerior").val(data.intdptocontacto);	
//     	if(data.intdptocontactodet){
//     		$("#interior").val(data.intdptocontactodet);	
//     	}else{
//     		$("#interior").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.lotedircontacto){
//     		$("#lote").val(data.lotedircontacto);	
//     	}else{
//     		$("#lote").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.refdomicontacto){
//     		$("#referencia").val(data.refdomicontacto);	
//     	}else{
//     		$("#referencia").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.telfijocontacto){
//     		$("#telfijoreclamante").val(data.telfijocontacto);	
//     	}else{
//     		$("#telfijoreclamante").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.telcelcontacto){
//     		$("#telcelularreclamante").val(data.telcelcontacto);	
//     	}else{
//     		$("#telcelularreclamante").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.emailcontacto){
//     		$("#emailreclamante").val(data.emailcontacto);	
//     	}else{
//     		$("#emailreclamante").val(C_NO_DISPONIBLE);
//     	}
// 		if(data.indllamada == "1"){
// 			$("#indautorizatel").attr("checked","checked");
// 		}
// 		if(data.indemail == "1"){
// 			$("#indautorizaemail").attr("checked","checked");
// 		}
// 		//Hoja Paso2
// 		//Seteando valores provenientes del servicio
// 		$("#nombre_agraviado").val(data.datosagraviado);
// 		var $radios = $('input:radio[name=indmenoredad]');
// 		if(data.nombrepadreagraviado){
// 			$radios.filter('[value=1]').prop('checked', true);
// 			$(".datos-agraviado").removeClass("hidden");
// 		}else{
// 			$radios.filter('[value=0]').prop('checked', true);
// 			$(".datos-agraviado").addClass("hidden");
// 		}
// 		$("#nompadre_agraviado").val(data.nombrepadreagraviado);
// 		$("#fec_atencion").val(data.fecreclamo);
//    		$("#tipoprovnoreg").val(data.tipprovnoregistrado);	
//     	if(data.nomprovnoregistrado){
//     		$("#provnoreg").val(data.nomprovnoregistrado);	
//     	}else{
//     		$("#provnoreg").val(C_NO_DISPONIBLE);
//     	}
//     	if(data.tiposervicio){
//     		$("#serviciorec").val(data.tiposervicio);	
//     	}else{
//     		$("#serviciorec").val(C_NO_DISPONIBLE);
//     	}
// 		$("#numreclamopiv").val(data.numreclamopiv);
//     	if(data.numpoliza){
//     		$("#numpoliza").val(data.numpoliza);	
//     	}else{
//     		$("#numpoliza").val(C_NO_DISPONIBLE);
//     	}
// 		//$("#nomtitular").val(data.);
//     	if(data.codigooperacion){
//     		$("#operaciondsc").val(data.codigooperacion);	
//     	}else{
//     		$("#operaciondsc").val(C_NO_DISPONIBLE);
//     	}
// 		if(data.codigomotivoreclamo == ''){
// 			$("#motivodsc").val(C_NO_DISPONIBLE);
// 		}else{
// 			$("#motivodsc").val(data.codigomotivoreclamo);
// 		}
//     	if(data.quejareclamo){
//     		$("#tipodereclamo").val(data.quejareclamo);	
//     	}else{
//     		$("#tipodereclamo").val(C_NO_DISPONIBLE);
//     	}
// 		$("#detallereclamo").val(data.descreclamo);
// 		if(data.inddevolucion == "1"){
// 			$("#registradevolucion").attr("checked","checked");
// 			$("#reclamo-requiere-devolucion").removeClass("hidden");
// 		}
		
// 		$("#montoreclamado").val(data.montoreclamo);
// 		if(data.indabonocta == "1"){
// 			$("#regcuentaabono").attr("checked","checked");
// 			$("#reclamo-cuenta-bancaria").removeClass("hidden");
// 		}
// 		$("#entidadbancaria").val(data.entidadbancaria);
// 		$("#tipocuenta").val(data.tipocuentaabono);
// 		$("#tipomoneda").val(data.tipomoneda);
//     	if(data.numctaabono){
//     		$("#numerocuenta").val(data.numctaabono);	
//     	}else{
//     		$("#numerocuenta").val(C_NO_DISPONIBLE);
//     	}
// 		$("#estadoreclamo").val(data.estadoreclamo);
	}
	
	function obtenerDatosxNumDoc(value){
		var param = new Object();
		param.idptipodocumento = V_TIPO_DOC_INTERNO;
		param.numerodoc = value;

		$.ajax({
			type		: "POST",
			url 		: '/ASISTENCIA/reclamo.do?method=obtPersonaByNumdoc',
			cache 		: false ,
			dataType	: "json",
			contentType	: "application/x-www-form-urlencoded; charset=UTF-8",
			data 		: {datos:JSON.stringify(param)},			
			async 		: false ,
			success 	: function(rsp) {
				var respuesta = eval(rsp);
				$('#appatreclamante').val(respuesta.apepaterno);
				$('#apmatreclamante').val(respuesta.apematerno);
				$('#nombrereclamante').val(respuesta.nombre);
    			$('#sexorec').val(respuesta.idpgenero);
    			$('#fec_nacim').val(respuesta.fecnacimiento);

							},
			error		: function (rsp, xhr, ajaxOptions, thrownError) {}
		});	
	}
	
	function obtenerDireccionContacto(data){
		var param = new Object();
		param.idepais = CODIGO_PERU;
		param.coddepartexterno = data.dptocontacto;
		param.codextprovincia = data.provcontacto;
		param.coddistexterno = data.distcontacto;
		
		
		$.ajax({
			type  		: "POST",
			url   		: '/ASISTENCIA/reclamo.do?method=obtDireccionByExt',
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data){
					var respuesta = eval(data);
					$("#idedepartamento").val(respuesta.dscdepartamento);
					$("#ideprovincia").val(respuesta.dscprovincia);
					$("#idedistrito").val(respuesta.dscdistrito);
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
	}
	
	function obtenerDireccionOcurrencia(data){
		var param = new Object();
		param.idepais = CODIGO_PERU;
		param.coddepartexterno = data.dptoorireclamo;
		param.codextprovincia = data.provorireclamo;
		//param.coddistexterno = data.provorireclamo;
		
		$.ajax({
			type  		: "POST",
			url   		: '/ASISTENCIA/reclamo.do?method=obtDireccionByExt',
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data){
					var respuesta = eval(data);
					$("#dptoocurrencia").val(respuesta.dscdepartamento);
					$("#provocurrencia").val(respuesta.dscprovincia);
					$("#distocurrencia").val(C_NO_DISPONIBLE);
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
	}

	function irpaso0SinReclamos(){
		$("#sin-reclamos").hide();
		$('#obtreclamos').click();
	}
</script>