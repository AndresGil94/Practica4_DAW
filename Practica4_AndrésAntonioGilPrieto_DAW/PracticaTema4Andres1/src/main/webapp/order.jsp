<%-- Página de órdenes de pedido --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, model.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>Pedido</title>
</head>
<body id="fondo">
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
	<section class="">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 mx-auto ">
					<h1 class="fw-dark text-center mt-2 ">Librería MVC</h1>
					<hr />
					<br />
				</div>
				<div class="col-10 mx-auto text-center offset-lg-1 text-center fondonegro p-4 text-light ">


					<h3 class="text-center mb-3">
						Elegir un libro y la cantidad:
					</h3>

					<form class="" name="AgregarForm" action="shopping" method="POST">


						<input class="" type="hidden" name="todo" value="add">

						<h3>Título:</h3>
						<select class="col-12  mx-auto "  name="idLibro">
							<%
							// Scriplet 1: Carga los libros en el SELECT
							UseCaseHandlerLibro uchl = new UseCaseHandlerLibro();
							ArrayList<Libro> aux = uchl.readAll();
							for (int i = 0; i < aux.size(); i++) {
								out.println("<option value='" + aux.get(i).getId() + "'>");
								out.println(aux.get(i).getTitulo() + " | " + aux.get(i).getAutor()) ;
								out.println("</option>");
							}
							%>
						</select>
						<h3 class=" mt-3 ">Cantidad:</h3>

						<div class="input-group col-12 ">
							<input class="form-control col-6" placeholder="Username" type="text"
								name="cantidad" size="10" value="1"> 
							<input class="hero-btn  col-6" type="submit" value="Añadir a la cesta">

						</div>
						
					</form>
					<hr />
					<br />

					<%
					// Scriplet 2: Chequea el contenido de la cesta
					ArrayList<LibroItem> cesta = (ArrayList<LibroItem>) session.getAttribute("carrito");
					if (cesta != null && cesta.size() > 0) {
					%>
					<div class="offset-lg-1 text-center fondonegro p-4 text-light">
					
					<p>
						<strong>Tu cesta contiene:</strong>
					</p>
					<table class="table text-light" border="1">
						<tr>
							<th>Autor</th>
							<th>Título</th>
							<th>Precio</th>
							<th>Cantidad</th>
						</tr>
						<%
						// Scriplet 3: Muestra los libros del carrito
						for (int i = 0; i < cesta.size(); i++) {
							LibroItem elementoPedido = cesta.get(i);
						%>
						<tr>
							<form name="borrarForm" action="shopping" method="POST">

								<input type="hidden" name="todo" value="remove"> <input
									type="hidden" name="indiceElemento" value="<%=i%>">
								<td><%=elementoPedido.getLibro().getTitulo()%></td>
								<td><%=elementoPedido.getLibro().getAutor()%></td>
								<td align="right"><%=elementoPedido.getLibro().getPrecio()%>€</td>
								<td align="right"><%=elementoPedido.getCantidad()%></td>
								<td><input class="hero-btn" type="submit"
									value="Eliminar de la cesta"></td>
							</form>
						</tr>
						<%
						}
						%>
					</table>
					<br />
					<form name="checkoutForm" action="shopping" method="POST">
						<input type="hidden" name="todo" value="checkout"> <input
							class="hero-btn" type="submit" value="Confirmar compra">
					</form>
					<%
					}
					%>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>