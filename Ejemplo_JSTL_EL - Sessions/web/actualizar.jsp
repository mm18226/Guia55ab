

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
            A continuación se cambia al registro ${param.id} el apellido: ${param.last} por este otro: ${param.nlast}</p>
        <c:if test="${empty param.id or empty param.last or empty param.nlast}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>           

        <c:set var = "empId" value = "${param.id}"/>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE employees SET last=?  WHERE  id=?
            <sql:param value="${param.nlast}"/>
            <sql:param value = "${empId}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from Employees;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.first}"/></td>
                    <td><c:out value = "${row.last}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                </tr>
            </c:forEach>
        </table>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE employees SET last = ?  WHERE  id=?
            <sql:param value = "${param.last}" />
            <sql:param value = "${empId}" />
        </sql:update>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from Employees;
        </sql:query>
        <br><br><br>
        <p style="color:blue;font-size: 7mm;">
            A continuación al registro ${param.id} se reestable el apellido original: ${param.last} siendo el anterior: ${param.nlast}</p>
        <table border = "1" width = "100%">
            <tr>
                <th>Emp ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.first}"/></td>
                    <td><c:out value = "${row.last}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
