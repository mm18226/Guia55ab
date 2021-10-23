
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Consultar" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REALIZAR UNA CONSULTA EN LA TABLA.</title>
        <script>
            function actualizar(id, last)
            {
                var nlast = prompt("Ingrese el apellido que reemplaza el actual apellido(" + last + ")");
                location.href = "actualizar.jsp?id=" + id + "&last=" + last + "&nlast=" + nlast;
            }
            function eliminar(id)
            {
                alert("A continuación se eliminará el registro #"+id);
                location.href = "eliminar.jsp?id=" + id;
            }
        </script>
        <style type="text/css">
              
        </style>
            
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>REALIZAR UNA CONSULTA EN LA TABLA , ACTUALIZAR (apellido) O ELIMINAR UN REGISTRO (id).</h1>
        <p style="color:darkblue;font-weight:bold;">Instrucciones: 
            <br>
            1. Para eliminar , de click sobre el id de la fila que desea eliminar<br>
            2. Para actualizar, de click sobre el apellido en la fila que desea actualizar(deberá ingresar el nuevo apellido)
        </p>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from employees;
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
                    <td onclick="eliminar('${row.id}');" 
                        onmouseover="this.style.backgroundColor='pink';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.id}"/>
                    </td>
                    <td><c:out value = "${row.first}"/></td>
                    <td onclick="actualizar('${row.id}', '${row.last}');"  
                        onmouseover="this.style.backgroundColor='green';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.last}"/>
                    </td>
                    <td><c:out value = "${row.age}"/></td>
                </tr>
            </c:forEach>
        </table>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
