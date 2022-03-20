<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" import="java.util.*, model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/807741f2ea.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Rubik+Beastly&display=swap" rel="stylesheet">
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<title>Ventana Principal</title>
</head>
<body>
<header>
<div class="col-12 text-center mx-auto ">

                       <div class="col-12 my-5">
                         <a href="Principal.jsp"> <img  alt="" src="./resources/logo.jpg" ></a>
                         <a href="Editoriales.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Editoriales</a> 
                         <a href="Autores.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Autores</a> 
                         <a href="Libros.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Libros</a> 
                         <a href="Pedidos.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Pedidos</a> 
                         <a href="Logout.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Salir</a> 
                         
                          
                        </div>

                    </div>
                   <div class="col-12 mt-5 text-center">
                   <a href="order.jsp"><input class="hero-btn  me-5 pe-5 col-5" type="submit" href="order.jsp" value="Comienza tu Pedido"></a>
                   		
                   </div>
	
</header>
</body>
</html>