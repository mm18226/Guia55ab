<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VALIDACION DE USUARIOS</title>
    </head>
    <body>
        <h1>Verificación de Usuarios</h1>
        <c:if test="${empty param.usuario or empty param.clave}">
            <c:redirect url="login.jsp">
                <c:param name="msg" value="usuario o clave vacios"/>
            </c:redirect>
        </c:if>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT count(*) as cant from users where login=? and password=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:if test="${result.rows[0].cant < 1}"> 
            <c:redirect url="login.jsp">
                <c:param name="msg" value="usuario o clave incorrectos"/>
            </c:redirect>
        </c:if> 
        <sql:query dataSource = "${fuenteDatos}" var = "datos">
            SELECT login,nombre,nivel from users where login=? and password=?;
            <sql:param value="${param.usuario}"/>
            <sql:param value="${param.clave}"/>
        </sql:query>
        <c:set var="user" value="${datos.rows[0].login}" scope="session" />
        <c:set var="nombre" value="${datos.rows[0].nombre}" scope="session" />
        <c:set var="nivel" value="${datos.rows[0].nivel}" scope="session" />
        <p style="color:red;"><br><br>En unos segundos se redirijirá a index</p>
                <script>
            setTimeout(function () {
                location.href = "index.jsp";
            }, 5000);
        </script>
    </body>
</html>
