  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div class="panel-body" id="registro-reclamo-container">
  <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
					<h4 style="margin: 0px;">Detalle del Ticket</h4>
					<hr style="margin: 0px; border-color: #dddddd;">	            
  </div> 
  <br>
  <br>
  <%-- <form:form action="serviceUser/reclamos-registrar/nuevo?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data" id="form-reclamos-registrar" method="post" modelAttribute="reclamo"> --%>
  <form:form enctype="multipart/form-data" id="form-reclamos-registrar" method="post" modelAttribute="reclamo">
    <div class="form-group">    	 
        <label class="control-label col-xs-3  required">Tipo:</label>
        <div class="col-xs-5">
         <select title="" class="selectpicker form-control" id="idtipocaso" name="idtipocaso">
         	<option value="">Seleccione</option>
         	<c:forEach items="${lstTipoCaso}" var="comboBox">
                <option value="${comboBox.value}">${comboBox.descripcion}</option>
            </c:forEach>
         </select>
          <div class="result"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3 required">Sistema:</label>
        <div class="col-xs-5">
         <select title="" class="selectpicker form-control" id="idsistema" name="idsistema">
         	<option value="">Seleccione</option>
         	<c:forEach items="${lstSistema}" var="comboBox">
                <option value="${comboBox.value}">${comboBox.descripcion}</option>
             </c:forEach>
         </select>
          <div class="result"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3 required">Producto:</label>
        <div class="col-xs-5">
         <select title="" class="selectpicker form-control" id="idproducto" name="idproducto">
         	<option value="">Seleccione</option>
         	 <c:forEach items="${lstProducto}" var="comboBox">
                <option value="${comboBox.value}">${comboBox.descripcion}</option>
             </c:forEach>
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
            <input title="" type="text" class="form-control" id="desctitulo" name="desctitulo">
             <div class="result"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3 required">Detalle del Caso:</label>
        <div class="col-xs-9">
            <textarea title="" rows="6" class="form-control" id="descdetallecaso" name="descdetallecaso" style="resize: none "></textarea>
             <div class="result"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3">Adjuntar Archivo:</label>
        <div class="col-xs-9">
            <!-- <input type="button" id="aniadirArchivo" name="aniadirArchivo" value="Adicionar adjunto" onclick="aniadirFilaAdjunto();">
            <table id="tablaficheros"> 	        
	        </table>  -->
	        <input title="Máximo 8MB permitidos" type="file" class="form-control" id="file" name="file">
	        <div class="result"></div>
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
           <a class='btn btn-primary' onclick='confirmarRegistro();' id='linkRegistrar'>Registrar</a>
        </div>
    </div>
    </form:form>
	<div id="content-dialog">
	</div>
	<div id="mensajes-registrar" hidden="hidden">
		<div class="col-md-12">
			<div id="container-mensaje"></div>
		</div>			   								   	
	</div>

<!-- 
    <a class='btn btn-primary' target="_blank" href="serviceUser/descargarArchivo" id='linkDescarga' onclick="alerta();">Descargar</a>
 -->    
</div>

