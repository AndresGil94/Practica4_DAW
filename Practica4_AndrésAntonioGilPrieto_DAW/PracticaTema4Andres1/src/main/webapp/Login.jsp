<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" import="java.util.*, model.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12 text-center my-3">
				<h1>Bienvenido a la Librería</h1>
				<h4>Añada su nombre de usuario y contraseña</h4>
			</div>
			<div class="col-10 mx-auto text-center mb-4">
				<form class="mt-3" name="AgregarForm" action="login" method="POST">

						<div class="input-group mb-3 col-11 my-3">
							<input class="form-control" placeholder="Usuario" type="text"
								name="user" size="10" > 
							
						</div>
			

						<div class="input-group col-11 ">
							<input class="form-control" type="password" placeholder="Contraseña" type="text"
								name="password" size="10" > 
							
						</div>
											<input	class="hero-btn mt-4 mx-auto w-50 col-5" type="submit"	value="Entrar" >
						
					</form>
			</div>
		</div>
	</div>


</body>
</html>