/*INI MFARFANR*/

function irInicio(){
	window.location.reload(true);		
}

function cerrarSession(){	
	document.formlogout.submit();
}

function bindBreadcrumb(){
    $("#accordion li a").each(function(index){
    	 
    	$(this).click(function(event){
    		
    		$("#content-breadcrumb").show();
    		$("#breadcrumb_list li").removeClass("active");
    		var indRemove		= "";
    		
            var attrHREF 		= $(this).attr('data-url');
            var attrTEXT 		= $(this).text();
            var attrDATA_PARENT	= $(this).attr('data-parent');
            
            if(attrDATA_PARENT != null && attrDATA_PARENT == "#accordion")	            	
            	$("#breadcrumb_list").empty();            	
            else
            	indRemove = "remove";
            	
            $("#breadcrumb_list .remove").remove();
            
            $("#breadcrumb_list").append("<li class='"+ indRemove +"'><a class='method-ajax' href='"+attrHREF+"' >"+attrTEXT+"</a><span class='divider'></span></li>");
            
            $("#breadcrumb_list li").last().addClass("active");
        });
        
    });
}

function loadModalCargando(){
	$("#link-content-cargando").click();
}

function closeModalCargando(){
	$("#content-cargando").modal('hide');
}

function loadModalMensaje(titulo,contenido,funcion){
	
	$("#titulo-mensaje").empty();
	$("#titulo-mensaje").html(titulo);
	
	$("#contenido-mensaje").empty();
	$("#contenido-mensaje").html(contenido);
	
	//$('#content-mensaje').unbind( "hidden.bs.modal" );
	
	if (funcion!=null){
		//$('#content-mensaje').unbind( "hidden.bs.modal" );
		$('#content-mensaje').on('hidden.bs.modal', funcion);
	}
	
	$("#link-content-mensaje").click();
}

function closeAlert(){
	$.fancybox.close();
}

function closeModalMensaje(){
	$("#content-mensaje").modal('hide');
};

jQuery.fn.dataTableExt.oApi.fnProcessingIndicator = function ( oSettings, onoff )
{
	if ( onoff === undefined ) {
		onoff = true;
	}
	this.oApi._fnProcessingDisplay( oSettings, onoff );
};

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

function cuotasVencidas(table){
	var nroCuotasVencidas = 0;
	var rows1 = $(table).dataTable().fnGetData();
	jQuery.each(rows1, function(i, val) {
		if(val.stsven=="VENCIDO"){
			nroCuotasVencidas++;
		}
	});
	return nroCuotasVencidas;
}
 
function cuotasMultiple(table){
	var nroCuotasMultiples 	= 0;
	var rows1 				= $(table).dataTable().fnGetData();
	
	jQuery.each(rows1, function(i, val) {
		if(val.numcert=='AGRUPADO' || val.tit=='MULTIPLES'){
			nroCuotasMultiples++;
		}
	});
	
	return nroCuotasMultiples;
}

function rowSelected(nomtabla,nomvar,functionName ){
	if(!window[nomvar]){
		window[nomvar] = null;
	}

	nomFunctionSeguros = null;
	nomFunctionSeguros = functionName;

	var table = $(nomtabla).DataTable();
	var tbody = nomtabla+ " tbody";
	
	$(tbody).unbind("click");
	
	$(tbody).on( 'click', 'tr', function () {	
		var data = table.column( 0 ).data();
		
		var r = table.row( this ).data();
		var idx = table.row( this ).index();
		window[nomvar] = {fila   : r,
		  			      indice : idx};
		if(nomvar == 'polizaMisSeguros'){
			dataLayer.push({'event': EV_VIEW_DETAILS, 'insuranceName': r.dscproducto, 'numDocument': CTE_NUM_DOC});
		}
	});

	$(tbody).on( 'click', 'td', function () {
	    var columnData = table.column( $(this).index()+':visIdx' );
	    var funcion = $(columnData.header()).hasClass("fn_asociada");
	    if(typeof nomFunctionSeguros!= 'undefined' && nomFunctionSeguros!=null && funcion == true){

	    	setTimeout(
			  function() 
			  {
				  window[functionName](nomvar);
	
			  }, 200);
		}
	    
	} );
	
	return false;
}
function getPolizaPdf2(data){
	var tituloError    = "Lo Sentimos"; 
	var contenidoError = "Su P&oacute;liza no se encuentra disponible en formato D&iacute;gital. La solicitud para su generaci&oacute;n ha sido enviada.";
	loadModalCargando();
	
	$.post("/PORTALWEB/misseguros.do?method=obtpolizasPDF",{data:JSON.stringify(data)},function(result){
		
		
		
		
			window.open("../"+result);
			closeModalCargando();
	})
	  .fail(function() {
		  closeModalCargando();
		  loadModalMensaje(tituloError,contenidoError,null);
	});
	
}

function getPolizaPdf(nomvar){
	
	var tituloError    = "Lo Sentimos"; 
	var contenidoError = "Su P&oacute;liza no se encuentra disponible en formato D&iacute;gital. La solicitud para su generaci&oacute;n ha sido enviada.";
	
	try{
		if(window[nomvar]){
			if(window[nomvar].fila){
				var param = window[nomvar].fila;
				
				loadModalCargando();
				$.post("/PORTALWEB/misseguros.do?method=obtpolizasCCM",{datos:JSON.stringify(param)},function(result){
					
					var resultado = eval(result);
					
					if(resultado[0].coderror !="0"){
						closeModalCargando(); 
						loadModalMensaje(tituloError,contenidoError,null);
					}
					else{
						closeModalCargando();					
						window.open("../"+resultado[0].path);
					}
				})
				  .fail(function() {
					  closeModalCargando();
					  loadModalMensaje(tituloError,contenidoError,null);
				});
			}
			else{
				loadModalMensaje(tituloError,contenidoError,null);
			}
		}
		else{
			loadModalMensaje(tituloError,contenidoError,null);
		}
	}
	catch (e) {
		closeModalCargando();
		loadModalMensaje(tituloError,contenidoError,null);
	}

	return false;
}

function blockSelected(strJson,nomVar,index){
	
	var str  = "["+ strJson.replace(/&/g,"\"") +"]";
	
	var json = eval(str);

	if(!window[nomVar]){
		
		window[nomVar] = null;
	}
	
	window[nomVar] = {fila   : json[0],
		     		  indice : index};
	
	return false;
}

function obtenerCobLista(titulo,contenido,JsonAdicionales){
	
	var iniTagList  	= "";
	var adicionales 	= "";
	
	titulo = titulo.trim();

	if(contenido){
		
		var iniTagAyuda = " <a href=\"javascript:void(0);\" " +
	  	  " title=\" <button type='button' class='close popover-dismiss' data-dismiss='modal' aria-hidden='true'>&times;</button> "+ titulo +" \"" +
	  	  " class=\"btn-popover list-group-item\" data-container=\"body\" " +
	  	  " data-toggle=\"popover\" data-html=\"true\" " +
	  	  " data-placement=\"top\" data-content=\" " + contenido +" \"> "+
	  	  " <i class=\"i-help\"></i> " +
	  	  " <span class=\"label-custom\">Cobertura: </span> " + titulo + " <ADICIONALES> </a>";
		
		iniTagList = iniTagAyuda;
	}
	else{
		var iniTagDiv   = "<div class=\"list-group-item\">"+
		  "<span class=\"label-custom\">Cobertura: </span> "+ titulo + "<ADICIONALES> </div>";
		
		iniTagList = iniTagDiv;
	}
	if(JsonAdicionales){
		jQuery.each(JsonAdicionales, function(i, val) {
				adicionales = " <br> " + adicionales + " <span class=\"label-custom\"> "+val.cabecera + ": </span> " + val.descripcion ;
		});
	}
	
	iniTagList = iniTagList.replace("<ADICIONALES>", adicionales);
	
	return iniTagList;
}

function obtenerCobTabla(titulo,contenido){
	var iniTagTabla = " <a href=\"javascript:void(0);\" "+
					  " title=\" <button type='button' class='close popover-dismiss' data-dismiss='modal' aria-hidden='true'>&times;</button> " + titulo + " \""+
					  " class=\"btn-popover\" data-container=\"body\" " +
					  " data-toggle=\"popover\" data-html=\"true\" "+
					  " data-placement=\"top\" data-content=\" " + contenido + "\">" +
					  " <i class=\"i-help\"></i> </a>";

	return iniTagTabla;
}

function abrirChatMedico(){
	dataLayer.push({'event': EV_VIRTUAL_PAGE, 'pageUrl': VP_GO_MEDICO_ONLINE, 'numDocument': CTE_NUM_DOC});
	window.open('http://chat1-cls1-cgn-bct.i6.inconcertcc.com/inconcert/apps/webdesigner/Rimac?token=1277462B88711D612ECC577DDE697D2D','_blank', 'menubar=no,toolbar=no,location=no,resizable=yes,scrollbars=yes,status=no,height=500,width=400');			
}

function toTitleCase(str){
	var strTittleCase = str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
    return strTittleCase;
}

function slug(str) {
	str = str.replace(/^\s+|\s+$/g, ''); // trim
	str = str.toLowerCase();

	// remove accents, swap ñ for n, etc
	var from = "ãàáäâẽèéëêìíïîõòóöôùúüûñç·/_,:;";
	var to   = "aaaaaeeeeeiiiiooooouuuunc------";
	
	for (var i=0, l=from.length ; i<l ; i++) {
		str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
	}

	str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
				.replace(/\s+/g, '-') // collapse whitespace and replace by -
				.replace(/-+/g, '-'); // collapse dashes

	return str;
};


function roundNumber(num, dec) {
	var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);	
	return result;
}

function formatNumber(obj, decimal) {

	//decimal  - the number of decimals after the digit from 0 to 3
	//-- Returns the passed number as a string in the xxx,xxx.xx format.
	anynum=eval(obj);
	
	divider =10;

   switch(decimal){

        case 0:
            divider =1;
            break;
        case 1:
            divider =10;
            break;
        case 2:
            divider =100;
            break;
        default:       //for 3 decimal places
            divider =1000;
    } 
   
   if(decimal == 0)
	   workNum=Math.abs((Math.ceil(anynum*divider)/divider));
   else
	   workNum=Math.abs((Math.round(anynum*divider)/divider)); 

   workStr=""+workNum; 
   
   if (workStr.indexOf(".")==-1){workStr+=".";} 

   dStr=workStr.substr(0,workStr.indexOf("."));
   
   dNum=dStr-0;

   pStr=workStr.substr(workStr.indexOf(".")); 

   while (pStr.length-1< decimal){pStr+="0";} 

   if(pStr =='.') pStr =''; 

   //--- Adds a comma in the thousands place.

   if (dNum>=1000) {
	   dLen=dStr.length;
	   dStr=parseInt(""+(dNum/1000))+","+dStr.substring(dLen-3,dLen);
   } 

   //-- Adds a comma in the millions place.

   if (dNum>=1000000) {
	   dLen=dStr.length;
	   dStr=parseInt(""+(dNum/1000000))+","+dStr.substring(dLen-7,dLen);
   }

   retval = dStr + pStr;
   
   //-- Put numbers in parentheses if negative.

   if (anynum<0) {retval="-"+retval;} 
  
   obj = retval;
   
   return obj;
}

function replaceAll(str, find, replace){
	return str.replace(new RegExp(find, 'g'), replace);
}
/*FIN MFARFANR*/


function cleanDatatable(idTabla){
	$(idTabla).dataTable().fnClearTable();
 	$(idTabla).dataTable().fnDestroy();
}

function mostrarDatatable(idGrupoProd, idTabla){
	load_event_ajax(); 
	
	var table = $(idTabla).dataTable();
	
	if(table.fnGetData().length == 0){
         table.parent().toggle(false);
         $(idGrupoProd).toggle(false);
	}
}

function ocultarDatatable(idGrupoProd, idTabla){
	$(idGrupoProd).toggle(false);
	
	var table = $(idTabla).dataTable();
	table.parent().toggle(false);
}

function linkDetalleSeguro(idTabla, metodo){
	return '<a class="method-ajax" ' +
				'href="/PORTALWEB/misseguros.do?method='+metodo+'" '+
				'onclick="return rowSelected(\''+idTabla+'\',\'polizaMisSeguros\')">'+
					'<i class="i-detalle"></i>'+
			'</a>';
	
}


function linkDescarPolizas(idTabla){

	return '<a href="#" ' +  
				'onclick= "return rowSelected(\''+idTabla+'\',\'polizaMisSeguros\',\'getPolizaPdf\')">'+
					'<i class="i-digital"></i>'+
			'</a>';

	
}
function linkDescarPolizas2(data){

	return '<a href="#" ' +  
				'onclick= "return getPolizaPdf3(\''+data+'\')">'+
					'<i class="i-digital"></i>'+
			'</a>';

	
}
function getPolizaPdf3(data){

	var link = document.createElement('a');
	link.href = data;
	link.download = 'file.pdf';
	link.dispatchEvent(new MouseEvent('click'));
}

function linkCoberturas(data, type, full, idTablaContainer, jsonInfoPoliza, indAsegurado, metodo){
	
	var enlace = null;

	if(type =='display'){
		
		var div = "<div class=\"modal fade\" id=\"miscoberturas"+indAsegurado+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">"+
					"<div class=\"modal-dialog\">"+
						"<div class=\"modal-content\">"+
							"<div class=\"modal-body\"></div>"+
						"</div>"+
						"</div>"+
				  "</div>";
		$( "#modalCoberturas" ).append(div);						 					
	}

	enlace = "<a data-toggle='modal' " +
					"href='/PORTALWEB/misseguros.do?method="+metodo+"' " +
					"data-target='#miscoberturas"+indAsegurado+"' "+
					"onclick='return rowSelected(\""+idTablaContainer+"\",\""+jsonInfoPoliza+"\");'>"+
						"<i class='i-cobertura'></i>" +
			 "</a>";

	return enlace;
}

function cargarContentResponsive(lstSegurosxRamo,idContenedor,metodo){
	
	$.each(lstSegurosxRamo, function(i, value) {
		var htmlDinamico	  = '';
		
		if(value.htmlDinamico!=undefined){
			htmlDinamico = value.htmlDinamico;
			value.htmlDinamico = '';					
		}
		
		var jsonPoliza 		  = JSON.stringify(value);                                
		var jsonPolizaReplace = jsonPoliza.replace(/"/g, '&');
		
		var elemento = '<a class="list-group-item method-ajax"  '+
						'href="/PORTALWEB/misseguros.do?method='+metodo+'" '+
						'onclick="return blockSelected(\'' + jsonPolizaReplace +'\',\'polizaMisSeguros\','+i+')"> ' +
						'<i class="next-mobile pull-right"> </i> ' +
						'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
						htmlDinamico +
						'<span class="label-custom">Pago: </span> '+ ((!value.estado)?"":value.estado.toUpperCase()) +
						'</a>';

		$(idContenedor).append(elemento);
	});	
}

function cargarTablaDetalleCuotas(jsonInputLstCuotas, idContentDetSeg, idContentLstCuotas, idTablaCuotasPol, idTablaResponsiveCuotasPol, idContentDscCuotasVenc){
	
	
	$.post("/PORTALWEB/misseguros.do?method=listarCuotas",
			{datos:JSON.stringify(jsonInputLstCuotas)},
			function(result){
				var jsonLstCuotas	= new Object();
				
				try{
					jsonLstCuotas	= eval(result);
		        	
		        	if(jsonLstCuotas[0].origen)
		        		jsonLstCuotas.coderror	= true;
		    	}catch(err) {
					jsonLstCuotas.coderror		= true;
				}
				
				if (jsonLstCuotas && jsonLstCuotas.coderror){
					closeModalCargando();
		       		$(idContentDetSeg).show();
					$(idTablaCuotasPol).parent().toggle(false);
		            $(idContentDscCuotasVenc).parent().toggle(false);
		      	}
		      	else{
		      		
		      		$(idTablaCuotasPol).dataTable().fnClearTable();
		      	 	$(idTablaCuotasPol).dataTable().fnDestroy();
		      			
		      		$(idTablaCuotasPol).DataTable({
		      				"order"				: [],
		      				"searching"			: false,
		      				"paging"			: false,
		      	          	"bInfo"				: false,
		      	          	"bAutoWidth" 		: false,   		      	          	
		      	          	"oLanguage" 		: {"sUrl": "/PORTALWEB/recursos/idioma/es_ES.txt"},
		      	          	"data"				: jsonLstCuotas,
		      	          	"createdRow"		: function( row, data, dataIndex ) {
		      				          					if ( data.stsven == "COBRADA" ) 
		      						          	      		$(row).addClass( 'fila_verde' );
		      				          					if ( data.stsven == "VENCIDO" ) 
		      						          	      		$(row).addClass( 'fila_roja' );						          	      		
		      						          	  		if ( data.stsven == "PENDIENTE" ) 
		      						          	      		$(row).addClass( 'fila_gris' );},
		      	            "columns"   		: [
		      										{ "orderable"	: false,
		      											"data"		: "fecvendoc", 
		      										    "sClass"	: "center", 
		      										   	"mRender"	: function (data, type, full) {
		      										   						var fecha = moment(data).utc().format('DD/MM/YYYY');
		      										   						return fecha;}},
		      										{ "orderable"	: false,
		      											"data"		: "numdoc",
		      											"sClass"	: "center"},
		      										{ "orderable"	: false,
		      											"data"		: "nrocuota",
		      											"sClass"	: "center"},
		      										{ "orderable"	: false,
		      											"data"		: "mtofactmoneda",
		      											"sClass"	: "center",												
		      											"mRender"	: function (data, type, full) {
		      																var monto = full.simmoneda + data;
		      																return monto;}},
		      										{ "orderable"	: false,
		      										 	"data"		: "stsven", 
		      										 	"sClass"	: "center" },
		      									 	{ "orderable"	: false,
		      											"data"		: "numcert",
		      											"sClass"	: "center",
		      											"visible"	: false}	
		      				                      ],
		      	            fnDrawCallback: function (settings) {
		      	        		closeModalCargando();
		      	        		$(idContentDetSeg).show();
		      	        		$(idContentLstCuotas).toggle(settings.fnRecordsDisplay() > 0);
		      	                $(idContentDscCuotasVenc).parent().toggle(settings.fnRecordsDisplay() > 0);

		      	                if(cuotasVencidas(idTablaCuotasPol)>0){
		      	                	$("#text-resumen-pagos").attr("style","color:red;font-weight:bold;");
		      	                	//$("#text-add-resumen").attr("style","color:red;font-weight:bold;");//RVALDIVC - 01/10/2015 //RVALDIVC - 16/11/2015
		      	                }

		      	                if(cuotasMultiple(idTablaCuotasPol)>0)
		      	                	$("#text-cuotas-multiple").show();
		      	            	
		      	                $("#text-resumen-pagos #nroCuotasVenc").text(cuotasVencidas(idTablaCuotasPol));
		      	            }
		      	    } );
		      		
		      		$.each(jsonLstCuotas, function(i, value) {
		      				var classContent = '';
		      				
		      				if ( value.stsven == "COBRADA" ) 
		      					classContent = 'content_verde ';
          					if ( value.stsven == "VENCIDO" ) 
          						classContent = 'content_roja ';						          	      		
		          	  		if ( value.stsven == "PENDIENTE" ) 
		          	  			classContent = 'content_gris ';
			          	    		
		      				var elemento =  '<div class="list-group-item">' +
		      									'<span class="label-custom">N&ordm; de cuota:</span> ' + value.nrocuota + '<br>' +
		      									'<span class="label-custom">N&ordm; de cup&oacute;n:</span> ' + value.numdoc + '<br>'  +
		      									'<span class="label-custom">Vencimiento:</span> ' + moment(value.fecvendoc).utc().format('DD/MM/YYYY') + '<br>'  +
		      									'<span class="label-custom">Estado:</span><span class="'+ classContent +'"> ' + value.stsven + '</span><br>'  +
		      									'<span class="label-custom">Cuota:</span> ' + value.mtofactmoneda  +
		      								'</div>';
		      				     			
		      				$(idTablaResponsiveCuotasPol).append(elemento);
		      		});		      				      				  					
		      	}
			});	
}


function loadValidateLogin(idForm){
	$(idForm).validate({
		rules			: {
							userlogin	: {
									required 		: true,
									minlength 		: 7,
									maxlength 		: 15,
									alfanumerico	: true
							},
							passlogin	: {
									required 		: true,
									minlength 		: 5,
									maxlength 		: 12,
									sinespacios		: true
							}
					},
		messages 		: {
							userlogin 	: {
									required		: "Campo obligatorio",
									minlength 		: "Ingrese m&iacute;nimo 7 caracteres",
									maxlength 		: "Ingrese m&aacute;ximo 15 caracteres",
									alfanumerico	: "En este campo s&oacute;lo se permiten n&uacute;meros y letras"
							},
							passlogin 	: {
									required		: "Campo obligatorio",
									minlength 		: "Ingrese m&iacute;nimo 5 caracteres",
									maxlength 		: "Ingrese m&aacute;ximo 12 caracteres",
									sinespacios		: "No se permiten espacios en blanco"
							}
					}
	});	
}

function obtCaptchaKeys(){
	
	$.ajax({
		type 		: "POST",
		url 		: "/PORTALWEB/login.do"+"?method=obtCaptchaKeys",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		data		: "",
		success 	: function(rsp) {
							CTE_PUBLIC_KEY	= rsp.publickey;
		},
		error : function(xhr, ajaxOptions, thrownError) {}
	});					
}

function enterPORTALWEB(e) {
  
	var keycode;

	if (window.event) 
	 keycode = window.event.keyCode;//IE
	else if (e) 
	 keycode = e.which;//otros
	else 
	 return true;
  
	if (keycode == 13){
	  if(loginForm())
		  document.formlogin.submit();
	}		  
} 
	
function validateAlfanumerico(){
	jQuery.validator.addMethod("alfanumerico", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
	});
}

function validateSinEspacios(){
	jQuery.validator.addMethod("sinespacios", function(value, element) {
        return this.optional(element) || /^[^\s]+$/.test(value);
	});
}

function loginForm(){
	
	if($("#formlogin").valid()){

		$("#mensajes-login").slideUp(1000);
		
		var param 			= new Object();
		param.mobile 		= $("#formlogin #mobile").val();
		param.useragent	 	= navigator.userAgent+" -*- "+navigator.platform;		
		param.userlogin 	= $("#formlogin #userlogin").val();
		param.passlogin 	= $("#formlogin #passlogin").val();
		
		$.ajax({
			type 		: "POST",
			url 		: "/PORTALWEB/login.do"+"?method=login",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			data		: param,
			success 	: function(rsp) {
			
							var indlogin 	= rsp.indlogin;	
							var escenario 	= rsp.escenario;
							var nrointento	= rsp.nrointento;
							
					  	    if (indlogin != 2 ){

								if(escenario == 4 && nrointento == 5 )
									$("#btn_olvide_contrasena").click();
								else	
									window.location.href = contextPath + "/"+ rsp.urldestino;
					  	    }else{							  	    	

								if(escenario == 4 && nrointento == 5 )
									$("#btn_olvide_contrasena").click();
								
					  	    	$("#formlogin #passlogin").val('');
					  	    	
					  	    	$("#msj-result-login").empty();

					  	    	$("#mensajes-login").slideDown(1000);
					  	    	$("#msj-result-login").html(rsp.mensaje);
					  	    }
			
			},
			error : function(xhr, ajaxOptions, thrownError) {}
		});
				  
	}else
		return false; 
}

function obtDatosUsuarioSesion(){
	$.ajax({
		type 		: "POST",
		url 		: "/PORTALWEB/perfil.do"+"?method=obtDatosUsuarioSesion",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success 	: function(rsp) {
		
			CTE_JSON_TELFSECPWEB = rsp.TelefonoSecweb[0];
			
			if(rsp.Correoweb.length>0)
				CTE_JSON_CORREOPWEB  = rsp.Correoweb[0];
			
			if(rsp.Direccionweb.length>0)
				CTE_JSON_DIRPWEB     = rsp.Direccionweb[0];
			
			if(rsp.Telefonoweb.length>0)
				CTE_JSON_TELFPWEB    = rsp.Telefonoweb[0];

			if(rsp.Usuarioweb.length>0)
				CTE_JSON_USUARIOPWEB = rsp.Usuarioweb[0];
			
			if(rsp.Personaweb.length>0)
				CTE_JSON_PERSONAPWEB = rsp.Personaweb[0];
			
			$("#form-datos-cliente #validacionlogin").val(rsp.validacion);
			$("#form-datos-cliente #idetercero").val(rsp.idetercero);
			$("#form-datos-cliente #codexterno").val(rsp.codexterno);
			$("#form-datos-cliente #numerodoc").val(rsp.numerodoc);
			$("#form-datos-cliente #indmobile").val(rsp.indmobile);

			CTE_MOBILE_IND = rsp.indmobile;
			
			if($.trim(CTE_JSON_PERSONAPWEB.nombre))
				$("#nameTitularHeader").text(toTitleCase(CTE_JSON_PERSONAPWEB.nombre));							
							
		},
		error : function(xhr, ajaxOptions, thrownError) {}
	});			
}


function obtDatosUsuarioSesionToken(token){
	
	var param 			= new Object();
	param.datos 		= '{"token":"'+token+'"}';
	
	$.ajax({
		type 		: "POST",
		url 		: "/PORTALWEB/perfil.do"+"?method=obtDatosUsuarioSesionxToken",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		data		: param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success 	: function(rsp) {
		
			CTE_JSON_TELFSECPWEB = rsp.TelefonoSecweb[0];
			
			if(rsp.Correoweb.length>0)
				CTE_JSON_CORREOPWEB  = rsp.Correoweb[0];
			
			if(rsp.Direccionweb.length>0)
				CTE_JSON_DIRPWEB     = rsp.Direccionweb[0];
			
			if(rsp.Telefonoweb.length>0)
				CTE_JSON_TELFPWEB    = rsp.Telefonoweb[0];

			if(rsp.Usuarioweb.length>0)
				CTE_JSON_USUARIOPWEB = rsp.Usuarioweb[0];
			
			if(rsp.Personaweb.length>0)
				CTE_JSON_PERSONAPWEB = rsp.Personaweb[0];
			
			$("#form-datos-cliente #validacionlogin").val(rsp.validacion);
			$("#form-datos-cliente #idetercero").val(rsp.idetercero);
			$("#form-datos-cliente #codexterno").val(rsp.codexterno);
			$("#form-datos-cliente #numerodoc").val(rsp.numerodoc);
			$("#form-datos-cliente #indmobile").val(rsp.indmobile);

			CTE_MOBILE_IND = rsp.indmobile;
			
			if($.trim(CTE_JSON_PERSONAPWEB.nombre))
				$("#nameTitularHeader").text(toTitleCase(CTE_JSON_PERSONAPWEB.nombre));							
							
		},
		error : function(xhr, ajaxOptions, thrownError) {}
	});			
}

function opObtenerDatosPersona(){
	if (CTE_JSON_PERSONAPWEB){
		
		tagManagerInicio(); //RVALDIVC - 16/12/2015
		
		var param 				= new Object();
		param.idptipodocumento 	= CTE_JSON_PERSONAPWEB.idptipodocumento;
		param.numerodoc 		= CTE_JSON_PERSONAPWEB.numerodoc;
		
		$.ajax({
			type 		: "POST",
			url 		: "/PORTALWEB/perfil.do?method=obtenerSegmentacionPersona",
			cache 		: false,
			async 		: true,
			dataType 	: 'json',
			data		: {datos:JSON.stringify(param)},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success 	: function(rsp) {

				if(rsp.data){
					CTE_SEGMENTO_CLIENTE = rsp.data;
					//[INI] DINGAN - 16/07/2015 - PORTALWEB
					//tagManagerInicio(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
					tagManagerEventoSegmento(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
					
				}else{
					
					CTE_SEGMENTO_CLIENTE = C_NO_DISPONIBLE;
					//tagManagerInicio(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
					tagManagerEventoSegmento(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				CTE_SEGMENTO_CLIENTE = C_NO_DISPONIBLE;
				//tagManagerInicio(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
				tagManagerEventoSegmento(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
			}
		});	
	}else{
		CTE_SEGMENTO_CLIENTE = C_NO_DISPONIBLE;
		//tagManagerInicio(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
		tagManagerEventoSegmento(CTE_SEGMENTO_CLIENTE);//RVALDIVC - 16/12/2015
		//[FIN] DINGAN - 16/07/2015 - PORTALWEB
	}
}
//[INI] DINGAN - 16/07/2015 - PORTALWEB
function tagManagerInicio(segmento){
	obtenerEdad();
	obtenerTipoDocumento();
	
	var MD5_CTE_IDETERCERO = CryptoJS.MD5(CTE_IDETERCERO);
	var prov = C_NO_DISPONIBLE;
	var dist = C_NO_DISPONIBLE;
	
	if(CTE_JSON_DIRPWEB){
		prov = CTE_JSON_DIRPWEB.dscprovincia;
		dist = CTE_JSON_DIRPWEB.dscdistrito;
	}

	dataLayer.push({
		'Analytics.clientId'		: MD5_CTE_IDETERCERO,
		'Analytics.cookieDomain'	: CTE_COOKIE_DOMAIN,
		'Customer.Provincia'		: prov,
		'Customer.Distrito'			: dist,
		'Customer.Age'				: CTE_EDAD,
		'Customer.Sex'				: CTE_JSON_PERSONAPWEB.idpgenero,
		//'Customer.Segment'			: segmento,//RVALDIVC - 16/12/2015
		'Customer.Codeclient'		: CTE_IDETERCERO,
		'Customer.TipoDocument'		: CTE_TIPODOC,
		'Customer.NroDocument'		: CTE_NUM_DOC
	});
}
//[FIN] DINGAN - 16/07/2015 - PORTALWEB

//[INI] RVALDIVC - 16/12/2015
function tagManagerEventoSegmento(segmento){
	dataLayer.push({'event': 'Segment', 'Customer.Segment': segmento});
}
//[FIN] RVALDIVC - 16/12/2015

function loadSesionInicial(){
	
	if(
		((CTE_JSON_USUARIOPWEB==undefined || CTE_JSON_USUARIOPWEB==null)||
	     (CTE_JSON_PERSONAPWEB==undefined || CTE_JSON_PERSONAPWEB==null)||
	     //(CTE_JSON_TELFPWEB==undefined 	|| CTE_JSON_TELFPWEB==null)||
	     //(CTE_JSON_DIRPWEB==undefined 	|| CTE_JSON_DIRPWEB==null)||
	     (CTE_JSON_CORREOPWEB==undefined 	|| CTE_JSON_CORREOPWEB==null)||
	     ($("#form-datos-cliente #idetercero").val()=="" || $("#form-datos-cliente #idetercero").val()=="null")||
	     ($("#form-datos-cliente #codexterno").val()=="" || $("#form-datos-cliente #codexterno").val()=="null")
	    ) && 
		   $("#form-datos-cliente #validacionlogin").val()!=RSP_LOGIN_REG_DIRECCION
	){
		cerrarSession();					
	}else{
		CTE_IDETERCERO 		= $("#form-datos-cliente #idetercero").val();
		CTE_NUM_DOC 		= $("#form-datos-cliente #numerodoc").val();
		CTE_RESP_VAL_LOGIN 	= $("#form-datos-cliente #validacionlogin").val();
		
		if(CTE_RESP_VAL_LOGIN==RSP_LOGIN_PRIMER_LOGIN){
			closeModalCargando();						 
			$("#link-primerlogueo").click();
		}
		if(CTE_RESP_VAL_LOGIN==RSP_LOGIN_REG_DIRECCION){
			closeModalCargando();						
			$("#link-registrardireccion").click();
		}
	}	
}

function initGTM(){
	var MD5_CTE_IDETERCERO = CryptoJS.MD5(CTE_IDETERCERO);
	
	dataLayer = [{
		'Analytics.clientId'		: MD5_CTE_IDETERCERO,
		'Analytics.cookieDomain'	: CTE_COOKIE_DOMAIN,
		'Customer.Provincia'		: CTE_JSON_DIRPWEB.dscprovincia,
		'Customer.Distrito'			: CTE_JSON_DIRPWEB.dscdistrito,
		'Customer.Age'				: CTE_EDAD,
		'Customer.Sex'				: CTE_JSON_PERSONAPWEB.idpgenero,
		'Customer.Segment'			: CTE_SEGMENTO_CLIENTE,
		'Customer.Codeclient'		: CTE_IDETERCERO,
		'Customer.TipoDocument'		: CTE_JSON_USUARIOPWEB.idptipodocumento,
		'Customer.NroDocument'		: CTE_NUM_DOC
	}];

	( function(w,d,s,l,i){
			w[l]=w[l]||[];
			w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});
			var f=d.getElementsByTagName(s)[0],
				j=d.createElement(s),
				dl=l!='dataLayer'?'&l='+l:'';
			j.async=true;
			j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;
			f.parentNode.insertBefore(j,f);
		}
	)(window,document,'script','dataLayer','GTM-NNJMDD');				
}

function obtenerEdad(){
   	var array_fecha = CTE_JSON_PERSONAPWEB.fecnacimiento.split("/");
   	//En el caso de los meses, se le resta "-1" porque comienza en 0;
	var fecNacim = new Date(parseInt(array_fecha[2]),parseInt(array_fecha[1])-1,parseInt(array_fecha[0]));
	
	var anoFNacim = fecNacim.getFullYear();
	var mesFNacim = fecNacim.getMonth();
	var diaFNacim = fecNacim.getUTCDate();
	
	var hoy = new Date();

	//-1 porque no se si ha cumplido a�os ya este a�o
   	edad=hoy.getFullYear() - anoFNacim - 1;  
   	
   	//si resto los meses y da mayor si ha cumplido 
   	if (hoy.getMonth() - mesFNacim > 0){ 
   		edad = edad + 1;
   	}

   	//Si los meses son iguales miro los d�as
   	if (hoy.getMonth() - mesFNacim == 0){
	   	if (hoy.getUTCDate() - diaFNacim >= 0){ 
	   		edad = edad + 1;
	   	}
   	}
   	CTE_EDAD = edad;
}

function obtenerTipoDocumento(){
	/******************************************************/
	CTE_TIPODOC = C_NO_DISPONIBLE;
		
	var param 				= new Object();
	param.codigo 			= CTE_JSON_USUARIOPWEB.idptipodocumento;
	param.idetippar 		= 'PWEB_REC_TIPDOC';
	
	$.ajax({
		type 		: "POST",
		url 		: "/PORTALWEB/perfil.do?method=obtParametro",
		cache 		: false,
		async 		: false,
		dataType 	: 'json',
		data		: {datos:JSON.stringify(param)},
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success 	: function(rsp) {
			CTE_TIPODOC = rsp.data;
			
		},
		error : function(xhr, ajaxOptions, thrownError) {CTE_TIPODOC = C_NO_DISPONIBLE;}
	});	
	
	/******************************************************/
	
}

function abrirRegistrarClientes(){
	$("#idmodalRegistro").load("/PORTALWEB/jsp/registro/registro-cliente.jsp"); 
}

function abrirOlvideContrasenia(){
	$("#idmodalOlvideContrasenia").load("/PORTALWEB/jsp/registro/olvido-contrasena.jsp");
}

function abrirRegistrarDireccion(){
	$("#idmodalDireccion").load("/PORTALWEB/jsp/perfil/registro-direccion.jsp");
}
