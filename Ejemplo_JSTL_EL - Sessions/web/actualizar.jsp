

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Actualizar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTUALIZAR UN REGISTRO DE LA TABLA</title>
        <style>
            .fila${param.id} {background-color:orange;}
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>ACTUALIZAR UN REGISTRO DE LA TABLA</h1>
        <p style="color:blue;font-size: 7mm;">
            A continuación se cambia al registro ${param.id} el titulo ${param.titulo} por este otro: ${param.ntitulo}</p>
        <c:if test="${empty param.id or empty param.titulo or empty param.ntitulo}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>           

        <c:set var = "libId" value = "${param.id}"/>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libros SET titulo=?  WHERE  id=?
            <sql:param value="${param.ntitulo}"/>
            <sql:param value = "${libId}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libros;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>Libros ID</th>
                <th>ISB</th>
                <th>Titulo</th>
                <th>Autor</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                </tr>
            </c:forEach>
        </table>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libros SET titulo = ?  WHERE  id=?
            <sql:param value = "${param.ntitulo}" />
            <sql:param value = "${libId}" />
        </sql:update>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libros;
        </sql:query>
        <br><br><br>
        <p style="color:blue;font-size: 7mm;">
            A continuación al registro ${param.id} se reestable el titulo original: ${param.titulo} siendo el anterior: ${param.ntitulo}</p>
        <table border = "1" width = "100%">
            <tr>
                <th>Libro ID</th>
                <th>ISB</th>
                <th>Titulo</th>
                <th>Autor</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
