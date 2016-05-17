   var markersMap  = [];
   var me = this;

   function cargarMapa(valor){

         cleanMarkers();

         $("#mapaEMVH").modal();

         setTimeout(function(){

                //Setear los puntos cuando el mapa se abré por segunda vez
                setMarkerLatLng(valor);                 
                //Ejecutar los listeners creados
                ejecutarListeners();              
         }, 500);
   }

   function setMarkerLatLng(valor){
         
         var txtlat     = $('input[name='+CTE_TAG_LATITUDORIGEN+']').val();
         var txtlng     = $('input[name='+CTE_TAG_LONGITUDORIGEN+']').val();
         var txtlatdes = $('input[name='+CTE_TAG_LATITUDDEST+']').val();
         var txtlngdes = $('input[name='+CTE_TAG_LONGITUDDEST+']').val();   

         CTE_MAPA.setZoom(CTE_MAPA.getZoom());

         if (txtlat!=""&&txtlng!=""&&txtlng!=undefined&&txtlat!=undefined){
                var coordOrigen = new google.maps.LatLng(txtlat,txtlng);

                var bound = new google.maps.LatLngBounds();
                bound.extend(coordOrigen );
                CTE_MAPA.setCenter(coordOrigen);
                setPointMarkerEmer(coordOrigen, 0);
                google.maps.event.trigger(CTE_MAPA, "resize");
                CTE_MAPA.fitBounds(bound);
                
                if (valor == 1){
                       CTE_CENTER_OK = 'NN';
                }
         }
         
         if (txtlatdes!=""&&txtlngdes!=""&&txtlatdes!=undefined&&txtlngdes!=undefined){
                var coordDestino = new google.maps.LatLng(txtlatdes,txtlngdes);
                if (CTE_CENTER_OK == 'OK'){
                       CTE_MAPA.setCenter(coordDestino);
                }
                
                setPointMarkerEmer(coordDestino, 1);
         }
   }

   function ejecutarListeners(){
         
         //Si hace clic en el mapa (No activa evento si hace clic sobre un poligono)
         google.maps.event.addListener(CTE_MAPA, 'click', function(event) {
                if (markersMap.length == 0){
                       //Asignar el marcador en el mapa dependiendo del orden
                       setPointMarkerEmer(event.latLng, markersMap.length);
                       setDireccionOrigen(event.latLng.lat(),event.latLng.lng());
                       CTE_MAPA.setZoom(CTE_MAPA.getZoom());
                       CTE_MAPA.setCenter(new google.maps.LatLng(event.latLng.lat(),event.latLng.lng()));
                }else if(markersMap.length == 1 && (CTE_SERVICIO_ACTUAL == CTE_SERVICIO_CONDUCTOR || CTE_SERVICIO_ACTUAL == CTE_SERVICIO_CONDUCTOR_PROG)){
                       //Asignar el marcador en el mapa dependiendo del orden
                       setPointMarkerEmer(event.latLng, markersMap.length);
                       setDireccionDestino(event.latLng.lat(),event.latLng.lng());
                }
         });
   };

   function setPointMarkerEmer(latLng,len){

         if (len<2){
                me['markersMa' + len]  = new google.maps.Marker({map        : CTE_MAPA,
                                                                                                 codigo       : len,
                                                                                                draggable    : true,
                                                                                                 icon         : '../img/rimac/marker'+len+'.png',
                                                                                                 animation    : google.maps.Animation.DROP,
                                                                                                 position     : latLng });
   
                markersMap.push(me['markersMa' + len]);

                //Cuando se arrastre un marcador
                google.maps.event.addListener(me['markersMa' + len] , 'dragend', function() {
                       //Se obtiene el punto de localización y se setea las cajas de latitud y longitud
                       geocodePosition(me['markersMa' + len],len);
                       CTE_DRAG_MARKER = 1;
                });
         }
   }

   //Obtiene la posicion en la que se suelta el marker
   function geocodePosition(marker,len) {
         geocoder = new google.maps.Geocoder();
         geocoder.geocode({ latLng: marker.getPosition()},function(results, status) {
                if (status == google.maps.GeocoderStatus.OK){
                       if (len==0){
                              setDireccionOrigen(marker.getPosition().lat(),marker.getPosition().lng());
                       }else if (len==1){
                              setDireccionDestino(marker.getPosition().lat(),marker.getPosition().lng());
                       }
               }
         });
   }

   function setDireccionOrigen(lat,lng){          
         $('input[name='+CTE_TAG_LATITUDORIGEN+']').val(lat);
         $('input[name='+CTE_TAG_LONGITUDORIGEN+']').val(lng);
         $('input[name='+CTE_TAG_LATITUDORIGEN+']').blur();
         $('input[name='+CTE_TAG_LONGITUDORIGEN+']').blur();
   }
   
   function setDireccionDestino(lat,lng){
         $('input[name='+CTE_TAG_LATITUDDEST+']').val(lat);
         $('input[name='+CTE_TAG_LONGITUDDEST+']').val(lng);         
         $('input[name='+CTE_TAG_LATITUDDEST+']').blur();
         $('input[name='+CTE_TAG_LONGITUDDEST+']').blur();
   }
   
   function getLatLngBlurOri(){
         getLatLngBlur('');
   }
   
   function getLatLngBlurDes(){
         getLatLngBlur('destino');
   }

   function getLatLngBlur(destino){
         var direccion        = null;
         var departamento = null;
         var provincia = null;
         var distrito = null;
         var latitud         = null;
         var longitud = null;

         var abrFS = (destino == '' ? 'diro' : 'dird');
         
         //Setear las variables de acuerdo al origen
         if (abrFS == "diro"){
                CTE_CENTER_OK = "NN";
                direccion     = CTE_TAG_DIRECCIONORIGEN;
                departamento = CTE_TAG_DEPARTORIGEN;
                provincia     = CTE_TAG_PROVINCIAORIGEN;
                distrito     = CTE_TAG_DISTRITOORIGEN;
                latitud             = CTE_TAG_LATITUDORIGEN;
                longitud     = CTE_TAG_LONGITUDORIGEN;
         }else if (abrFS == "dird"){
                direccion     = CTE_TAG_DIRECCIONDEST;
                departamento = CTE_TAG_DEPARTDEST;
                provincia     = CTE_TAG_PROVINCIADEST;
                distrito     = CTE_TAG_DISTRITODEST;
                latitud             = CTE_TAG_LATITUDDEST;
                longitud     = CTE_TAG_LONGITUDDEST;
                CTE_CENTER_OK = "OK";
         }
         
         if ($('select[name='+distrito+'] option:selected').val() == ''){
                loadModalMensaje("Estimado cliente,","Por favor seleccione el distrito "+destino+".","");
                $('input[name='+direccion+']').val('');
         }else{
                if (CTE_DIRORIGEN == $('input[name='+CTE_TAG_DIRECCIONORIGEN+']').val()&&
                       CTE_LATITUD   != $('input[name='+CTE_TAG_LATITUDORIGEN+']').val()&&
                       CTE_LONGITUD  != $('input[name='+CTE_TAG_LONGITUDORIGEN+']').val()&&
                       CTE_DRAG_MARKER == 1&&
                       abrFS == "diro"){
                       CTE_MAPA.setCenter(new google.maps.LatLng($('input[name='+latitud+']').val(),$('input[name='+longitud+']').val()));
                       CTE_MAPA.setZoom(CTE_MAPA.getZoom());
                       $("#mapaEMVH").modal();
                }else if (CTE_DIRDESTINO == $('input[name='+CTE_TAG_DIRECCIONDEST+']').val()&&
                       CTE_LATITUDDEST   != $('input[name='+CTE_TAG_LATITUDDEST+']').val()&&
                       CTE_LONGITUDDEST  != $('input[name='+CTE_TAG_LONGITUDDEST+']').val()&&
                       CTE_DRAG_MARKER == 1&&
                       abrFS == "dird"){
                       CTE_MAPA.setCenter(new google.maps.LatLng($('input[name='+latitud+']').val(),$('input[name='+longitud+']').val()));
                       CTE_MAPA.setZoom(CTE_MAPA.getZoom());
                       $("#mapaEMVH").modal();
                }else{
                       //Limpia los campos de latitud y longitud del formulario 
                       $('input[name='+latitud+']').val('');
                       $('input[name='+longitud+']').val('');
   
                       //Concatenamos los valores del formulario para buscar la dirección en google maps
                     var address = $('input[name='+direccion+']').val() + ' ' +
                                            $('select[name='+departamento+'] option:selected').text()  + ' ' +
                                            $('select[name='+provincia+'] option:selected').text()  + ' ' +
                                            $('select[name='+distrito+'] option:selected').text();
   
                     //Creamos un buscador de direcciones
                       var geocoder = new google.maps.Geocoder();
   
                       if (abrFS == "diro"){
                              CTE_DIRORIGEN  = $('input[name='+direccion+']').val();
                              CTE_LATITUD     = $('input[name='+latitud+']').val();
                              CTE_LONGITUD   = $('input[name='+longitud+']').val();
                       }else{
                              CTE_DIRDESTINO = $('input[name='+direccion+']').val();
                              CTE_LATITUDDEST     = $('input[name='+latitud+']').val();
                              CTE_LONGITUDDEST = $('input[name='+longitud+']').val();
                       }

                       CTE_LATITUD         = CTE_LATITUD              == "" ? "LatA" : CTE_LATITUD;
                       CTE_LONGITUD        = CTE_LONGITUD             == "" ? "LngA" : CTE_LONGITUD;
                       CTE_LATITUDDEST     = CTE_LATITUDDEST   == "" ? "LatB" : CTE_LATITUDDEST;
                       CTE_LONGITUDDEST    = CTE_LONGITUDDEST == "" ? "LngB" : CTE_LONGITUDDEST;
                       
                       geocoder.geocode( {'address': address}, function(results, status) {
                              if (status == google.maps.GeocoderStatus.OK) {
                                     $('input[name='+latitud+']').val(results[0].geometry.location.lat());
                                     $('input[name='+longitud+']').val(results[0].geometry.location.lng());
                                    cargarMapa();
                              }
                       });
                }
         }
   }
   
   function cleanMarkers(){
         for (var i = 0; i < markersMap.length; i++) {
                markersMap[i].setMap(null);
         }
         
         markersMap  = [];          
   }
