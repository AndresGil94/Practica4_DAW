<%-- Página de confirmación del pedido --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, model.*"%>
<!DOCTYPE html>
<html>
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
<title>Confirmación</title>
</head>
<body id="fondo">
	<div class="container-fluid">
		<div class="row">

			<div class="col-12 text-center mx-auto">
				<h1>Librería MVC: Confirmación</h1>
				<hr />
				<br />

				<p>
					<strong>Has comprado los siguientes libros:</strong>
				</p>
				</div>
				<div class=" col-10 col-md-10 mx-auto offset-lg-1 text-center fondonegro p-4 text-light">
				<table class="table table-striped text-light  col-10" border="1">					
				 <thead>
					<tr>
						<th>Título</th>
						<th>Autor</th>
						<th>Precio</th>
						<th>Cantidad</th>
					</tr>
					 </thead>
					<%
					// Muestra los elementos del carrito
					ArrayList<LibroItem> cesta = (ArrayList<LibroItem>) session.getAttribute("carrito");
					for (int i = 0; i < cesta.size(); i++) {
						LibroItem elementoPedido = cesta.get(i);
					%>
					 <tbody>
					<tr>
						<td class="my-3"><%=elementoPedido.getLibro().getTitulo()%></td>
						<td><%=elementoPedido.getLibro().getAutor()%></td>
						<td align="right"><%=elementoPedido.getLibro().getPrecio()%>
							€</td>
						<td align="right"><%=elementoPedido.getCantidad()%></td>
					</tr>

					<%
					}
					session.setAttribute("carrito", null);
					%>
					 <thead>
					<tr>
						<th align="right" colspan="2">Total</th>
						<th align="right"><%=request.getAttribute("precioTotal")%></th>
						<th align="right"><%=request.getAttribute("cantidadTotal")%></th>
					</tr>
					 </tbody>
					
				</table>
						<br /> <a href="shopping" class="text-center mt-4 text-primary">Pulsa aquí para realizar otro pedido</a>
				
				</div>

			</div>
		</div>

	</div>
</body>
</html>

