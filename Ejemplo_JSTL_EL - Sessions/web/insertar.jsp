
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Insertar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERTAR UN REGISTRO EN LA TABLA</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>INSERTAR UN REGISTRO EN LA TABLA</h1>
        <p>*observe que en la tabla el registr agregado se marca con fondo verde</p>
        <c:if test="${empty param.age or empty param.first or empty param.last or empty param.xage}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO employees (age,first,last)  VALUES (?, 'Anonimo', 'Ali');
            <sql:param value="${param.xage}"/>
        </sql:update>


        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO employees (age,first,last) VALUES (?,?,?);
            <sql:param value="${param.age}"/>
            <sql:param value="${param.first}"/>
            <sql:param value="${param.last}"/>                
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
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.first}"/></td>
                    <td><c:out value = "${row.last}"/></td>
                    <td><c:out value = "${row.age}"/></td>
                </tr>
            </c:forEach>
        </table>
        <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
        <script>
           var nuevo=document.getElementsByTagName("table")[1].lastElementChild.lastElementChild;
           nuevo.style.backgroundColor="lightgreen";            
        </script>
    </body>
</html>
