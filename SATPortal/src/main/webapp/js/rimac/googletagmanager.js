/*CONSTANTES GOOGLE TAG MANAGER*/
//Virtual Pages
var VP_GO_ZONA;
var VP_GO_ZONAPRIVADA		  = '/zonaprivada';
var VP_GO_ZONAPUBLICA		  = '/zonapublica';

var VP_GO_MIS_SEGUROS 		  = VP_GO_ZONA + '/mis-seguros';
var VP_GO_BUSCADOR_CLINICAS01 = VP_GO_ZONA + '/buscador-de-clinicas-paso01';
var VP_GO_BUSCADOR_CLINICAS02 = VP_GO_ZONA + '/buscador-de-clinicas-paso02';
var VP_GO_BUSCADOR_CLINICAS03 = VP_GO_ZONA + '/buscador-de-clinicas-paso03';
var VP_GO_BUSCADOR_TALLERES01 = VP_GO_ZONA + '/servicios-vehiculos/buscador-talleres-paso01';
var VP_GO_BUSCADOR_TALLERES02 = VP_GO_ZONA + '/servicios-vehiculos/buscador-talleres-paso02';
var VP_GO_BUSCADOR_TALLERES03 = VP_GO_ZONA + '/servicios-vehiculos/buscador-talleres-paso03';
var VP_GO_CHOFER_REEMPLAZO 	  = VP_GO_ZONA + '/servicios-vehiculos/chofer-reemplazo';
var VP_GO_AUXILIO_MECANICO    = VP_GO_ZONA + '/servicios-vehiculos/auxilio-mecanico';
var VP_GO_GRUA 				  = VP_GO_ZONA + '/servicios-vehiculos/grua';
var VP_GO_CHOQUE_ROBO 	      = VP_GO_ZONA + '/choque-robo';
var VP_GO_MEDICO_ONLINE 	  = VP_GO_ZONA + '/servicios-salud/medico-online';
var VP_GO_CARTA_GARANTIA 	  = VP_GO_ZONA + '/servicios-salud/carta-garantia';
var VP_GO_ACTUALIZAR_DATOS 	  = VP_GO_ZONA + '/actualiza-datos';
var VP_GO_CAMBIO_CONTRASENA   = VP_GO_ZONA + '/mi-perfil/cambio-contrasena';
var VP_GO_CAMBIO_PREGUNTA 	  = VP_GO_ZONA + '/mi-perfil/cambio-pregunta';
var VP_GO_ALERTAS 			  = VP_GO_ZONA + '/mi-perfil/alertas';
var VP_GO_RECLAMO 			  = VP_GO_ZONA + '/reclamos';
var VP_GO_RECLAMO_REGISTRAR   = VP_GO_ZONA + '/reclamos/registrar';
var VP_GO_MOBILE_INICIO		  = VP_GO_ZONA + '/mobile/inicio';
var VP_GO_MOBILE			  = VP_GO_ZONA + '/mobile';
var VP_GO_MISSEGUROS_TOKEN    = VP_GO_ZONA + '/mobile/misseguros-token';
var VP_GO_ACTUALIZADATOS_TOKEN    = VP_GO_ZONA + '/mobile/actualizadatos-token';   	//[EHUAMANIM - 10/03/2016]
var VP_GO_CAMBIOCONTRASENA_TOKEN  = VP_GO_ZONA + '/mobile/cambiocontrasena-token'; 	//[EHUAMANIM - 10/03/2016]
var VP_GO_CAMBIOPREGUNTA_TOKEN    = VP_GO_ZONA + '/mobile/cambiopregunta-token';	//[EHUAMANIM - 10/03/2016]
var VP_GO_CHOFER_REEMPLAZO_SOLICITAR =  VP_GO_ZONA + '/servicios-vehiculos/chofer-reemplazo/solicitar';

//Eventos
var EV_VIRTUAL_PAGE 		   = 'virtualPage';
var EV_VIEW_DETAILS 		   = 'viewDetails';
var EV_VIEW_COVERAGE 		   = 'viewCoverage';
var EV_ACTUALIZA_DATOS    = 'updateDataProfile';
var EV_ACTUALIZA_CONTRASENA    = 'updatePassword';
var EV_VALIDA_PREGUNTA_SEGURIDAD    = 'validateSecurityQuestion';
var EV_CAMBIO_PREGUNTA_SEGURIDAD    = 'changeSecurityQuestion';
var EV_HISTORIAL_SOLICITUDES    = 'solicitudHistory';
var EV_TIPO_CHOFER_REEMPLAZO    = 'tipoChoferReemplazo';
var EV_GENERAR_SINIESTRO_TRY    = 'generarSiniestroTry';
var EV_GENERAR_GRUA_TRY    = 'generarGruaTry';
var EV_GENERAR_SOLICITUD_SERVICIO    = 'generarSolicitudServicio';
var EV_REGISTRAR_RECLAMO    = 'registrarReclamo';

//GOOGLE TAG MANAGER
var CTE_ID_TAG_MANAGER;

//[INI] KCARRANZAP - 10/08/2015
var CTE_IND_BUSQUEDA_CLINICA = null;
var CTE_IND_BUSQUEDA_TALLER = null;

//CLINICAS
var CTE_DSC_CLINICA = null;
var CTE_CLINICA_NOMDEPART = "";
var CTE_CLINICA_NOMPROVINCIA = "";
var CTE_CLINICA_NOMDISTRITO = "";

//TALLERES
var CTE_DSC_TALLERES = null;
var CTE_TALLERES_NOMDEPART = "";
var CTE_TALLERES_NOMPROVINCIA = "";
var CTE_TALLERES_NOMDISTRITO = "";
//[FIN] KCARRANZAP - 10/08/2015