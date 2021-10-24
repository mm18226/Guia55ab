<%-- 
    Document   : insert
    Created on : Oct 19, 2021, 4:42:44 PM
    Author     : migue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar libro</title>
    </head>
    <body>
        <sql:setDataSource var = "fuenteDatos" driver = "org.mariadb.jdbc.Driver"
                           url = "jdbc:mariadb://localhost:3308/biblioteca"
                           user = "root"  password = ""/>
        
        <c:if test="${sessionScope.nivel eq 2 or sessionScope.nivel eq 0 or sessionScope.nivel eq -1 or sessionScope.nivel eq null}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="nivel"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        int isbn = Integer.parseInt(request.getParameter("isbn"));
        String autor = request.getParameter("autor");
        String titulo = request.getParameter("titulo");
        String editorial = request.getParameter("editorial");
        <h1>INSERTAR UN REGISTRO EN LA TABLA</h1>
        <c:if test="${empty param.isbn or empty param.titulo or empty param.autor or empty param.editorial}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro(isbn, titulo, autor, editorial)  VALUES (?, ?, ?, ?);
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>
            <c:if test = "${result == 1}">
            <c:out value="Operación realizada con éxito"/>
            </c:if>
            <c:if test = "${result != 1}">
            <c:out value="Algo ha salido mal"/>
            </c:if>
            <br><br>
        <a href="index.jsp" style="font-size:0.5cm;color:green;">Volver a Inicio</a>
    </body>
</html>
