<!-- trabajar con la libreria core de jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/dataTables.bootstrap5.min.css" rel="stylesheet">

<title>Mantenimiento Docente</title>
<style>
	.modal-header{
		color:#fff;
		background: #428bca;
		display: flex;
  		justify-content: center;
  		
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
	<div class="container">
	
		<c:if test="${requestScope.MENSAJE!=null}">	
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
			  <strong>Sistema : </strong> ${requestScope.MENSAJE}
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
	
	
	  <h2 class="text-center mt-3">LISTADO DE DOCENTES</h2>
	  <button type="button" class="btn btn-primary mt-3" data-bs-toggle="modal" data-bs-target="#modalDocente">
	  	Nuevo Docente
	  </button>
	  <!-- Modal -->
		<div class="modal fade" id="modalDocente" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Docente</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form id="frmDocente" action="ServletDocente?tipo=GRABAR" method="post">
		          <div class="form-group">
				    <label for="nombres" class="form-label">Código</label>
				    <input type="text" class="form-control" name="codigo" value="0" id="id-codigo" readonly>
				  </div>
				  <div class="form-group">
				    <label for="nombres" class="form-label">Nombres</label>
				    <input type="text" class="form-control" name="nombres" id="id-nombre">
				  </div>
				  <div class="form-group">
				    <label for="paterno" class="form-label">Paterno</label>
				    <input type="text" class="form-control" name="paterno" id="id-paterno">
				  </div>
				  <div class="form-group">
				    <label for="materno" class="form-label">Materno</label>
				    <input type="text" class="form-control" name="materno" id="id-materno">
				  </div>				  
				  <div class="form-group">
				    <label for="sueldo" class="form-label">Sueldo</label>
				    <input type="text" class="form-control" name="sueldo" id="id-sueldo">
				  </div>				  
				  <div class="form-group">
				    <label for="hijos" class="form-label">Hijos</label>
				    <input type="text" class="form-control" name="hijos"id="id-hijos">
				  </div>
				  <div class="form-group">
				    <label for="sexo" class="form-label">Sexo</label>
				    <select class="form-select form-control" name="sexo" id="id-sexo">
					  <option value="" selected>[Seleccione Sexo]</option>
					  <option value="Femenino">Femenino</option>
					  <option value="Masculino">Masculino</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label for="condicion" class="form-label">Condición</label>
				    <select class="form-select form-control" name="condicion" id="id-condicion">
					  <option value="" selected>[Seleccione Condición]</option>
					</select>
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
		        <form id="frmDocente" action="ServletDocente?tipo=ELIMINAR" method="post">
				    <input type="hidden" name="codigoEliminar" id="id-codigo-eliminar">	  
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
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  <div class="mt-5">
		  <table id="example" class="table table-striped" style="width:100%">
	        <thead>
	            <tr>
	                <th>CÓDIGO</th>
	                <th>NOMBRE</th>
	                <th>PATERNO</th>
	                <th>MATERNO</th>
	                <th>SEXO</th>
	                <th>HIJOS</th>
	                <th>SUELDO</th>
	                <th></th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
		        <!--abrir la etiqueta forEach  
		        atributo items,sirve para almacenar el atributo que viene del Servlet
		        atributo var, sirve para crear un objeto que almacene el valor actual según la vuelta del for
		        -->
		        <c:forEach items="${requestScope.listaDocentes}" var="row">	
		            <tr>
		                <td>${row.codigo}</td>
		                <td>${row.nombre}</td>
		                <td>${row.paterno}</td>
		                <td>${row.materno}</td>
		                <td>${row.sexo}</td>
		                <td>${row.hijos}</td>
		                <td>${row.sueldo}</td>
		                <td><button type="button" class="btn btn-success btn-editar" data-bs-toggle="modal" data-bs-target="#modalDocente">Editar</button></td>
						<td><button type="button" class="btn btn-danger btn-eliminar" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
		                
		            </tr>
				</c:forEach>
	        </tbody>
	    </table>
	  </div>
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	</div>
<script src="js/jquery-3.5.1.js"></script>
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- JS para la tabla -->
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

<!-- JS para la validación-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>
	$(document).ready(function () {
	    $('#example').DataTable();
	});
	
	leerCondicionJSON();
	
	//asignar evento click a todos los botones con nombre de clase "btn-editar"
	//JQUERY
	$(document).on("click",".btn-editar",function(){
		//variables
		let cod,nom,pat,mat,sexo,hijos,sue;
		//leer columnas de la fila donde se hizo click en el botón editar
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletDocentePorID?codigo="+cod,function(response){
			console.log(response);
			document.querySelector("#id-codigo").value=response.codigo;
			document.querySelector("#id-nombre").value=response.nombre;
			document.querySelector("#id-paterno").value=response.paterno;
			document.querySelector("#id-materno").value=response.materno;
			document.querySelector("#id-sexo").value=response.sexo;
			document.querySelector("#id-hijos").value=response.hijos;
			document.querySelector("#id-sueldo").value=response.sueldo;
			document.querySelector("#id-condicion").value=response.codigoCondicion;
		})
		
		/*
		nom=$(this).parents("tr").find("td")[1].innerHTML;
		pat=$(this).parents("tr").find("td")[2].innerHTML;
		mat=$(this).parents("tr").find("td")[3].innerHTML;
		sexo=$(this).parents("tr").find("td")[4].innerHTML;
		hijos=$(this).parents("tr").find("td")[5].innerHTML;
		sue=$(this).parents("tr").find("td")[6].innerHTML;
		*/
	})
	
	//asignar evento click a todos los botones con nombre de clase "btn-eliminar"
	//JQUERY
	$(document).on("click",".btn-eliminar",function(){
		//variable
		let cod;
		//leer columna(còdigo) de la fila donde se hizo click en el botón eliminar
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		document.querySelector("#id-codigo-eliminar").value=cod;
	})
		
	//función para leer json
	function leerCondicionJSON(){
		//funcion JQUERY
		$.get("ServletCondicionJSON",function(response){
			//imprimir consola del navegador
			//console.log(response);
			//bucle
			$.each(response,function(index,item){
				$("#id-condicion").append("<option value='"+item.codigo+"'>"+item.nombre+"</option>");				
			})
		})
		
	}
</script>
<script>    
    $(document).ready(function(){     
        $('#frmDocente').bootstrapValidator({      
        	 fields:{
        		 nombres:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo nombres es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\ñ\Ñ\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{2,20}$/,
        					 message:'Campo nombres solo letras MIN:3 - MAX:20'
        				 }
        			 }
        		 },
        		 paterno:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo paterno es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\ñ\Ñ\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{4,25}$/,
        					 message:'Campo paterno solo letras MIN:4 - MAX:25'
        				 }
        			 }
        		 },
        		 materno:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo materno es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\ñ\Ñ\s\á\é\í\ó\ú\Á\É\Í\Ó\Ú]{4,25}$/,
        					 message:'Campo paterno solo letras MIN:4 - MAX:25'
        				 }
        			 }
        		 },
        		 sueldo:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo sueldo es obligatorio'
        				 }
        			 }
        		 }, 
        		 hijos:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo hijos es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^([0-9]|[1][0-2])$/,
        					 message:'Campo hijos MIN:0 - MAX:12'
        				 }
        			 }
        		 },
        		 sexo:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo sexo es obligatorio'
        				 }
        			 }
        		 },
        		 condicion:{
        			 validators:{
        				 notEmpty:{
        					 message:'Campo condición es obligatorio'
        				 }
        			 }
        		 },
        		 
        	 }
        });   
			
    });    
</script>   	
</body>
</html>

















