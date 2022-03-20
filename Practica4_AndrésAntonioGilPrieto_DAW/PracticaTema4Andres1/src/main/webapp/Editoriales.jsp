<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" import="java.util.*, model.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<header>
<div class="col-12 text-center text-muted">

                        <div class="col-12 my-3">
                         <a href="Principal.jsp"> <img alt="" src="./resources/logo.jpg" ></a>
                         <a href="Editoriales.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Editoriales</a> 
                         <a href="Autores.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Autores</a> 
                         <a href="Libros.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Libros</a> 
                         <a href="Pedidos.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Pedidos</a> 
                         <a href="Logout.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Salir</a>  
                        </div>

                    </div>
                   
</header>
	<div class="container">
		<div class="row offset-lg-1 text-center fondonegro p-4">
			<div class="col-12 text-center mb-4">
				<h1>Editoriales</h1>
				<h3 >Estos las editoriales con quienes trabajamos:</h3>
			</div>
			<div class=" col-12 mx-auto ">
				<select class="form-select form-control-lg " style="height: 150px"
				  multiple aria-label="multiple select example">
				
  					<%
							// Scriplet 1: Carga los libros en el SELECT
							UseCaseHandlerEditorial uche = new UseCaseHandlerEditorial();
							ArrayList<Editorial> aux = uche.readAll();
							for (int i = 0; i < aux.size(); i++) {
								 
								out.println("<option value='" + i + "'>");
								out.println( aux.get(i).getNombre());
								out.println("</option>");
							}
							%>
							
				</select>
				 <div class="col-12 mt-5 text-center">
                   <a href="Principal.jsp"><input class="hero-btn  me-5 pe-5 col-5" type="submit" href="order.jsp" value="Menú Principal"></a>
                   		
                   </div>
			</div>
		</div>
	</div>
</body>
</html>