<%-- 
    Document   : update
    Created on : Oct 19, 2021, 4:43:07 PM
    Author     : migue
--%>

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
        <title>Libro actualizado</title>
    </head>
    <body>
        
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            UPDATE libro SET titulo=?  WHERE  isbn=?
            <sql:param value="${param.titulo}"/>
            <sql:param value = "${param.isbn}" />
        </sql:update>
        
            <c:if test="${result==1}">
                <c:out value="Operación realizada con éxito"/>
            </c:if>
            <c:if test="${result!=1}">
                <c:out value="Algo ha salido mal"/>
            </c:if>
            
        
        <a href="index.jsp" style="font-size:0.5cm;color:green;">Volver a Inicio</a>
    </body>
</html>
