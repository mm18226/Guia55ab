<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Autenticacion de usuario</h1>
        <div id="container">
            <c:if test="${not empty param.msg}">
                <p style="color:red;">Error: ${param.msg}</p>
            </c:if>
            <form name="login" action="validar.jsp" method="post">
                <!-- Nombre -->
                <label for="usuario">Login:</label>
                <input name="usuario" id="usuario" type="input" value="">
                <!-- Constrasena -->
                <label for="clave">Clave:</label>
                    <input name="clave" id="clave" type="password">
                <div id="lower">
                    <input type="submit" value="Ingresar">
                </div>
            </form>       
        </div>
    </body>
</html>