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
				<a href="Principal.jsp"> <img alt="" src="./resources/logo.jpg"></a>
				<a href="Editoriales.jsp"> <span
					class="text-primary fw-bold mx-2 mx-md-4">/</span> Editoriales
				</a> <a href="Autores.jsp"> <span
					class="text-primary fw-bold mx-2 mx-md-4">/</span> Autores
				</a> <a href="Libros.jsp"> <span
					class="text-primary fw-bold mx-2 mx-md-4">/</span> Libros
				</a> <a href="Pedidos.jsp"> <span
					class="text-primary fw-bold mx-2 mx-md-4">/</span> Pedidos
				</a>
				<a href="Logout.jsp" >  <span class="text-primary fw-bold mx-2 mx-md-4">/</span> Salir</a> 
				

			</div>

		</div>

	</header>

	<div class="container">
		<div class="row mx-auto text-center">
			<div
				class="col-10 text-center mt-5 offset-lg-1 text-center ">
				<%
				UseCaseHandlerPedido uchp = new UseCaseHandlerPedido();
				ArrayList<Pedido> pedidos = uchp.readAll();
				for (int i = 0; i < pedidos.size(); i++) {
					Pedido elementoPedido = pedidos.get(i);
				%>
				<table class="table text-light text-center fondonegro p-4 text-light" border="1">
						
				<tr>
					<form name="borrarPedidoForm " action="shopping" method="POST">

						<input type="hidden" name="todo" value="removePedido"> <input
							type="hidden" name="indiceElemento"
							value="<%=elementoPedido.getRef_id()%>">


						<%
						ArrayList<LibroItem> libros = uchp.readLibrosFromPedido(elementoPedido.getRef_id());
						for (int k = 0; k < libros.size(); k++) {
						%>
						<td>ID: <%=elementoPedido.getRef_id()%></td>
						
						<td>Titulo: <%=libros.get(k).getLibro().getTitulo()%></td>
						<td>Cantidad: <%=libros.get(k).getCantidad()%></td>
						<td>Importe: <%=elementoPedido.getImporte()%></br></td>

						<%
						}
						%>
						<td><input class="hero-btn ms-5 my-3" type="submit"
							value="Eliminar pedido"></td>

					</form>
				</tr>
				<%
				}
				%>
				</table>
			</div>

		</div>
	</div>
</body>
</html>