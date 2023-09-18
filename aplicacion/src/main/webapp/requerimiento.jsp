<!-- incluir página menu.jsp -->
<jsp:include page="menu.jsp"/>
<!-- trabajar con la libreria core de jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/dataTables.bootstrap5.min.css" rel="stylesheet">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
<title>Requerimiento</title>
<style>
	.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
	}
	.modal-card{
		color:#fff;
		background: #428bca;
	}
	.help-block {
	  		color: red;
	}
	.form-group.has-error .form-control-label {
	  color: red;
	}
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
</style>
</head>
<body>
<input type="hidden" value="${sessionScope.rol}" id="id-rol">

	<div class="container">
	
		<c:if test="${param.MENSAJE!=null}">	
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  <strong>Sistema : </strong> ${param.MENSAJE}
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
	
	
	  <h2 class="text-center mt-3">LISTADO DE REQUERIMIENTOS</h2>
	  <div class="card">
	  	<c:if test="${sessionScope.rol=='JEFE'}">
		  <div class="card-header modal-card">
		  	
			   <button type="button" class="btn btn-success mt-3" data-bs-toggle="modal" 
			   				data-bs-target="#modalRequerimiento">
			  	Nuevo Requerimiento
			  </button>
			  
	  	  </div>
		  </c:if>
		  <div class="card-body">
		    	  <div class="mt-5">
					  <table id="tableRequerimientos" class="table table-striped" style="width:100%">
				        <thead>
				            <tr>
				                <th>CÓDIGO</th>
				                <th>NÚMERO</th>
				                <th>NOMBRE</th>
				                <th>FECHA</th>
				                <th>ESTADO</th>
				                <c:if test="${sessionScope.rol=='SUPERVISOR'}">
				                <th>USUARIO</th>
				                </c:if>
				                <th></th>
				                <th></th>
				            </tr>
				        </thead>
				        <tbody>
					       
				        </tbody>
				    </table>
			  	</div>
		  </div>
		</div>
	  
	  
	  
	  
	  <!-- Modal -->
		<div class="modal fade" id="modalRequerimiento" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Nuevo Requerimiento</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        	<form class="row g-3" action="ServletRequerimiento?accion=GRABAR" method="post">
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Número</label>
					    <input type="text" class="form-control" readonly id="id-numero" name="numero">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Nombre Requerimiento</label>
					    <input type="text" class="form-control" id="inputPassword4" name="nombre">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Fecha Requerimiento</label>
					    <input type="text" class="form-control" value="${sessionScope.fecha}" readonly name="fecha">
					  </div>
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Remitente</label>
					    <input type="text" class="form-control"  value="${sessionScope.datosUsuario}" readonly>
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Cargo</label>
					    <input type="text" class="form-control" id="inputPassword4" readonly>
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Estado</label>
					    <input type="text" class="form-control" id="inputPassword4" readonly value="Iniciado" name="estado">
					  </div>
					  <div class="col-md-6">
					    <label for="inputCity" class="form-label">Cantidad a solicitar</label>
					    <input type="text" class="form-control" id="id-cantidad">
					  </div>
					  <div class="col-md-6">
					    <label for="inputState" class="form-label">Detalle</label>
						    <table id="tableDetalle" class="table table-striped" style="width:100%">
					        <thead>
					            <tr>
					                <th>CÓDIGO</th>
					                <th>DESCRIPCIÓN</th>
					                <th>CANTIDAD</th>
					                <th></th>
					            </tr>
					        </thead>
					        <tbody>
						       
					        </tbody>
					    </table>
					  </div>
					  <div class="col-md-6">
					    <label for="inputState" class="form-label">Listado de Bienes</label>
						    <table id="tableBienes" class="table table-striped" style="width:100%">
					        <thead>
					            <tr>
					                <th>CÓDIGO</th>
					                <th>DESCRIPCIÓN</th>
					                <th></th>
					            </tr>
					        </thead>
					        <tbody>
						       
					        </tbody>
					    </table>
					  </div>
					  <div class="modal-footer">
					  	<button type="submit" class="btn btn-primary">Grabar</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
				      </div>
					</form>
		      </div>
		    </div>
		  </div>
		</div>
	  <!-- FIN MODAL -->
	 
	 
	 	  <!-- Modal -->
		<div class="modal fade" id="modalDetalle" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Detalle Requerimiento</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        	<form class="row g-3" action="ServletRequerimiento?accion=GRABAR" method="post">
		        	  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Código</label>
					    <input type="text" class="form-control" readonly id="id-codigoD" name="numero">
					  </div>
					  
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Número</label>
					    <input type="text" class="form-control" readonly id="id-numeroD" name="numero">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Nombre Requerimiento</label>
					    <input type="text" class="form-control" id="id-nombreD" name="nombre" readonly>
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Fecha Requerimiento</label>
					    <input type="text" class="form-control"  id="id-fechaD" readonly name="fecha">
					  </div>
					  <div class="col-md-4">
					    <label for="inputEmail4" class="form-label">Remitente</label>
					    <input type="text" class="form-control" readonly id="id-remitenteD" value="${sessionScope.datosUsuario}">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Cargo</label>
					    <input type="text" class="form-control" id="id-cargoD" readonly value="${sessionScope.rol}">
					  </div>
					  <div class="col-md-4">
					    <label for="inputPassword4" class="form-label">Estado</label>
					    <input type="text" class="form-control" id="id-estadoD" readonly value="Iniciado" name="estado">
					  </div>
					  <div class="col-md-6">
					    <label for="inputState" class="form-label">Listado de Bienes</label>
						    <table id="tableDetalleBienes" class="table table-striped" style="width:100%">
					        <thead>
					            <tr>
					                <th>CÓDIGO</th>
					                <th>DESCRIPCIÓN</th>
					                <th>CANTIDAD</th>
					            </tr>
					        </thead>
					        <tbody>
						       
					        </tbody>
					    </table>
					  </div>
					  <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
				      </div>
					</form>
		      </div>
		    </div>
		  </div>
		</div>
	  <!-- FIN MODAL -->
	 
	 
	  <!-- Modal Eliminar-->
		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Sistema</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<h4>Seguro de eliminar?</h4>
		        <form id="frmDocente" action="ServletRequerimiento?accion=ELIMINAR_REQUERIMIENTO" method="post">
				    <input type="text" name="codigoEliminar" id="id-codigo-eliminar">	  
				  <div class="modal-footer">
				  	<button type="submit" class="btn btn-primary">SI</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
			      </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	  <!-- FIN MODAL Eliminar-->	
	 
	 
	 
	 
	 
	 
	 
	 
	  
	</div>
<script src="js/jquery-3.5.1.js"></script>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- JS para la tabla -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<!-- JS para la validación-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>


<script>
	llenarBienes();
	llenarNumero();
	llenarDetalle();
	llenarRequemientos();
	
	
	function llenarBienes(){
		$.get("ServletBienJSON",function(response){
			//console.log(response);
			let boton="<button type='button' class='btn btn-primary btn-adicionar'>+</button>";
			$.each(response,function(i,item){
				$("#tableBienes").append("<tr><td>"+item.codigoBien+"</td><td>"+
								 item.descripcion+"</td><td>"+boton+"</td></tr>");
			})
			$('#tableBienes').DataTable();
		})
	}
	function llenarRequemientos(){
		$.get("ServletRequerimiento?accion=LISTAR",function(response){
			console.log(response);
			let boton1="<button type='button' class='btn btn-success btn-ver' data-bs-toggle='modal' data-bs-target='#modalDetalle'>Ver</button>";
			let boton2="<button type='button' class='btn btn-danger btn-eliminarReque' data-bs-toggle='modal' data-bs-target='#modalEliminar'>X</button>";
			
			let rol=$("#id-rol").val();
			
			$.each(response,function(i,item){
				if(rol=='SUPERVISOR'){
					$("#tableRequerimientos").append("<tr><td>"+item.codigoRequerimiento+"</td><td>"+
								 item.numeroRequerimiento+"</td><td>"+item.nombreRequerimiento+"</td><td>"+
								 moment(item.fechaRequerimiento).format('YYYY-MM-DD')+"</td><td>"+
								 item.estado+"</td><td>"+item.datosUsuario+"</td><td>"+boton1+
								 "</td><td>"+boton2+"</td></tr>");
				}
				else{
					$("#tableRequerimientos").append("<tr><td>"+item.codigoRequerimiento+"</td><td>"+
							 item.numeroRequerimiento+"</td><td>"+item.nombreRequerimiento+"</td><td>"+
							 moment(item.fechaRequerimiento).format('YYYY-MM-DD')+"</td><td>"+
							 item.estado+"</td><td>"+boton1+
							 "</td><td>"+boton2+"</td></tr>");
					
				}
				
			})
			$('#tableRequerimientos').DataTable();
		})
	}
	
	
	$(document).on("click",".btn-adicionar",function(){
		let cod,des,can;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		des=$(this).parents("tr").find("td")[1].innerHTML;
		can=$("#id-cantidad").val();
		if(can=="")
			swal("", "Ingresar cantidad", "error");
		else{
			$.get("ServletRequerimiento?accion=ADICIONAR&codigo="+cod+"&descripcion="+des+"&cantidad="+can,function(response){
				console.log(response);
				if(response==-1){
					//alert("");
					swal("Sistema", "Código de bien existe", "error");
				}	
				else{
					let boton="<button type='button' class='btn btn-danger btn-eliminar'>X</button>";
					//limpiar tabla
					$("#tableDetalle tbody").empty();
					$.each(response,function(i,item){
						$("#tableDetalle").append("<tr><td>"+item.codigoBien+"</td><td>"+
										 item.descripcion+"</td><td>"+item.cantidad+"</td><td>"+boton+"</td></tr>");
					})
				}			
				
			})
		}
	})
	
	$(document).on("click",".btn-eliminar",function(){
		let cod
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletRequerimiento?accion=ELIMINAR&codigo="+cod,function(response){
			console.log(response);
			let boton="<button type='button' class='btn btn-danger btn-eliminar'>X</button>";
			//limpiar tabla
			$("#tableDetalle tbody").empty();
			$.each(response,function(i,item){
				$("#tableDetalle").append("<tr><td>"+item.codigoBien+"</td><td>"+
								 item.descripcion+"</td><td>"+item.cantidad+"</td><td>"+boton+"</td></tr>");
			})
		})
	})
	function llenarNumero(){
		$.get("ServletRequerimiento?accion=CODIGO",function(response){
			$("#id-numero").val(response);
		})
		
	}
	function llenarDetalle(){
		$.get("ServletRequerimiento?accion=DETALLE",function(response){
			let boton="<button type='button' class='btn btn-danger btn-eliminar'>X</button>";
			//limpiar tabla
			$("#tableDetalle tbody").empty();
			$.each(response,function(i,item){
				$("#tableDetalle").append("<tr><td>"+item.codigoBien+"</td><td>"+
								 item.descripcion+"</td><td>"+item.cantidad+"</td><td>"+boton+"</td></tr>");
			})
		})
	}
	
	$(document).on("click",".btn-ver",function(){
		let cod,num,nom,fec,est;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		num=$(this).parents("tr").find("td")[1].innerHTML;
		nom=$(this).parents("tr").find("td")[2].innerHTML;
		fec=$(this).parents("tr").find("td")[3].innerHTML;
		est=$(this).parents("tr").find("td")[4].innerHTML;
		
		$("#id-codigoD").val(cod);
		$("#id-numeroD").val(num);
		$("#id-nombreD").val(nom);
		$("#id-fechaD").val(fec);
		$("#id-estadoD").val(est);
		
		$.get("ServletRequerimiento?accion=DETALLEREQUE&codigo="+cod,function(response){
			//limpiar tabla
			$("#tableDetalleBienes tbody").empty();
			$.each(response,function(i,item){
				$("#tableDetalleBienes").append("<tr><td>"+item.codigoBien+"</td><td>"+
								 item.descripcion+"</td><td>"+item.cantidad+"</td></tr>");
			})
		})
	})

	$(document).on("click",".btn-eliminarReque",function(){
		let cod
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$("#id-codigo-eliminar").val(cod);
		
	})	
</script>


</body>
</html>

















