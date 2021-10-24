
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Eliminar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR UN REGISTRO DE LA TABLA</title>
        <style>
            .fila${param.id} {background-color:red;color:pink;}
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>ELIMINAR UN REGISTRO DE LA TABLA</h1>
        <c:if test="${sessionScope.nivel eq 1 or sessionScope.nivel eq 0 or sessionScope.nivel eq -1 or sessionScope.nivel eq null}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="nivel"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:if test="${empty param.id}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>    
        <c:set var = "libId" value = "${param.id}"/>
        
        
        <h3>Observe que el registro a borrar se marca de color rojo en la primera tabla y que en la segunda tabla ya no aparece</h3>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libros;
        </sql:query>
            
        <table border = "1" width = "100%">
            <tr>
                <th>Libro ID</th>
                <th>ISB Name</th>
                <th>Titulo Name</th>
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
            DELETE FROM libros WHERE Id = ?
            <sql:param value = "${libId}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libros;
        </sql:query>
            <h3>Favor verifique que el registro ha sido borrado con éxito</h3>
        <table border = "1" width = "100%">
            <tr>
                <th>Lirbo ID</th>
                <th>ISB</th>
                <th>Titulo</th>
                <th>Autor</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
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
