<script>

	var layout 			= 'border';
	var showDrawManager = false;
	var drawManager		= null;
	var gmapType		= 'map'; //Pendiente de generalizar
	var polygonMap		= [];
	var markerMap		= [];
	
	function setPolygonsOnMap(v){
		var me= this, polygons=[], d; 
		//me.pMap.deletePolygonsOnMap();

			for(var i=0; i < v.length; i++){ 
				d = v[i];
				var datosPolygon = { id			  : d.idezona,
								     nomzona	  : d.nomzona,
					             dsczona	  : d.dsczona,
				                 strokeWeight : d.strokeweight,
							     strokeColor  : d.strokecolor,
							     fillColor	  : d.fillcolor,
							     fillOpacity  : d.fillopacity,
							     editable	  : false,
						         visible	  : true,
						         draggable	  : false,
					             path		  : createPolygonPath(eval(d.coords), 2, 3)}; 
				polygons.push(datosPolygon);
			}
			addPolygons(polygons);
	}
	
	function createPolygonPath(coords, posLat, posLng){
		var path=[];
		if(!posLat) posLat = 0;
		if(!posLng) posLng = 1;

		if (Array.isArray(coords)){
			for(var i=0; i<coords.length; i++){ 
	    		path.push(new google.maps.LatLng(coords[i][posLat], coords[i][posLng]));
			}
		}
		return path;
	}
	
	function addPolygons(polygons) { 
	    var me = this, o = [];
		if (Array.isArray(polygons)){
	        for (var i = 0; i < polygons.length; i++) {
	             var polygon = addPolygon(polygons[i]);
	             o.push(polygon);
	        }
	    }
		return o;
	}
	
    //Agrega un poligono al mapa. Recibe un json
    function addPolygon(polygon){
    	var me = this,
    	polygonOptions = {
    		id			:  !polygon.id ? Ext.id() : polygon.id,
			fillColor	: '#000000',
			fillOpacity	: .1,
			strokeWeight: 2,
			strokeColor : '#000000',
			clickable	: true,
			editable	: false,
			zIndex		: 1, 
			draggable	: false,
			visible		: true,
			map			: me.gmap
		};

		//var o = new google.maps.Polygon(Ext.apply(polygonOptions, polygon));
    	var o = new google.maps.Polygon($.extend(polygonOptions, polygon));
		//me.addPolygonDefaultListeners(o);
		
    	for ( listener in polygon.listeners ){    
			google.maps.event.addListener(o, "" + listener, polygon.listeners["" + listener]);    
		}

    	o.setMap(me.gmap);
    	
    	me.saveOverlay({overlay: o, type: 'polygon'});
        return o;  
    }
    
    //Listeners por defecto para todos los polygonos
    function addPolygonDefaultListeners(polygon_){
    	var me = this;
    	google.maps.event.addListener(polygon_, 'click', function(pointClicked, polygon){   		
			 me.selectPolygonOnMap(polygon.id);
		}.delegate(me,[polygon_], true));
		
    	google.maps.event.addListener(polygon_, 'dblclick', function(pointClicked, poly){   		
    		me.fireEvent('polygondblclicked', {polygon: poly});
		}.delegate(me,[polygon_], true));
    	
		google.maps.event.addListener(polygon_.getPath(), "insert_at", function(idx, newPoly, x, y){
	         me.fireEvent('polygonvertexinserted', {polygon: newPoly, index: idx}); 
	    }.delegate(me,[polygon_], true));
		
		google.maps.event.addListener(polygon_.getPath(), "set_at", function(idx, oldCoord, newPoly){
	         me.fireEvent('polygonvertexseted', {polygon: newPoly, index: idx, 'oldCoord': oldCoord}); 
	    }.delegate(me,[polygon_], true));
    }
    
    //Guarda el overlay creado en un array dependiendo del tipo
    function saveOverlay(overlay){
    	var me = this, idTemp_= 1;// Ext.id();
    	if(!overlay.overlay.id)
    		overlay.overlay.setOptions({id: idTemp_});
    	overlay.overlay.setOptions({idTemp: idTemp_});
    	if(overlay.type == 'polygon'){
    		var polygon = overlay.overlay,
    		item = {polygon	: overlay.overlay, initConfig: {strokeWeight: polygon.strokeWeight, 
														    fillOpacity : polygon.fillOpacity, 
														    strokeColor : polygon.strokeColor, 
														    fillColor   : polygon.fillColor,
														    fillColor   : polygon.fillColor,
														    draggable   : polygon.draggable,
														    visible	    : true,
														    editable	: polygon.editable}};
    		 me.deleteItemPolygonMap(overlay.overlay.id);
    		me.polygonMap.push(item);
    	
    	} else if(overlay.type == 'marker'){
    		var marker = overlay.overlay;
    		me.markerMap.push({marker: overlay.overlay, initConfig: {position: marker.position}});
    	} 
    }
    
    function deleteItemPolygonMap(itemPolygon){
    	var me = this, idxp;
    	if(itemPolygon){
    		 idxp = me.polygonMap.indexOf(itemPolygon);
    		 if(idxp > -1)
    			me.polygonMap.splice(idxp, 1);
    	}  
    }
    
</script>