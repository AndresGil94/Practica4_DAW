<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- restablecer v. sesion user y pass a null, y redirecciona a login
Session invalidate
 -->
 <!-- Scriplet -->
 <%
	session.setAttribute("carrito", null);
	session.setAttribute("user", null);
	session.setAttribute("password", null);

 response.sendRedirect("login");
							%>
</body>
</html>