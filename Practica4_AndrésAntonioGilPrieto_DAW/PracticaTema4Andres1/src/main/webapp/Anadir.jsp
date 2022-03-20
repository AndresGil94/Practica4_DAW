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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/807741f2ea.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Rubik+Beastly&display=swap"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 text-center mx-auto ">

		<div class="col-12 my-5">
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



	<div class="container">
		<div class="row offset-lg-1 mx-auto text-center fondonegro p-4">
			<div class="col-md-12">
				<div class="well well-sm mx-auto text-center">
					<form class="form-horizontal" action="shopping" method="post">
						<fieldset>
							<legend ><h2 class="text-center">Añadir Libro</h2></legend>
							<input class="" type="hidden" name="todo" value="anadir">

							<div class="form-group ">
								<div class="col-md-8 mb-3  mx-auto">
									<input id="titulo" name="titulo" type="text"
										placeholder="Nombre" class="form-control"
										style="margin-bottom: 20px">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-8 mb-3  mx-auto">
									<input id="precio" name="precio" type="text"
										placeholder="Precio" class="form-control"
										style="margin-bottom: 20px">
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-8 mb-3  mx-auto">
									<select class="col-12" aria-label="Default select example" name="autor">
										<%
										// Scriplet 1: Carga los libros en el SELECT
										UseCaseHandlerAutor uchl = new UseCaseHandlerAutor();
										ArrayList<Autor> aux = uchl.readAll();
										for (int i = 0; i < aux.size(); i++) {
											out.println("<option value='" + aux.get(i).getId() + "'>");
											out.println(aux.get(i).getNombre());
											out.println("</option>");
										}
										%>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-8 mb-3  mx-auto">
									<select class="col-12" aria-label="Default select example" name="editorial">
										<%
										// Scriplet 1: Carga los libros en el SELECT
										UseCaseHandlerEditorial uche = new UseCaseHandlerEditorial();
										ArrayList<Editorial> aux2 = uche.readAll();
										for (int i = 0; i < aux2.size(); i++) {
											out.println("<option value='" + aux2.get(i).getId() + "'>");
											out.println(aux2.get(i).getNombre());
											out.println("</option>");
										}
										%>
									</select>
								</div>
							</div>



							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="hero-btn btn-lg mt-3">Añadir</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>