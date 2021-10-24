<%-- 
    Document   : delete
    Created on : Oct 19, 2021, 4:43:14 PM
    Author     : migue
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libro Eliminado</title>
    </head>
    <body>
        <sql:setDataSource var = "fuenteDatos" driver = "org.mariadb.jdbc.Driver"
                           url = "jdbc:mariadb://localhost:3308/biblioteca"
                           user = "root"  password = ""/>


        <sql:update dataSource = "${fuenteDatos}" var = "result">
            DELETE FROM libro WHERE isbn = ?
            <sql:param value = "${param.isbn}" />
        </sql:update>
        <c:if test="${result == 1}">
            <c:out value="Operación realizada con éxito"/>
        </c:if>
        <c:if test="${result != 1}">
            <c:out value="Algo ha salido mal"/>
        </c:if>
        <br><br>
        <a href="index.jsp" style="font-size:0.5cm;color:green;">Volver a Inicio</a>
    </body>
</html>
