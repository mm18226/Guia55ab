
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
            function actualizar(id, titulo)
            {
                var ntitulo = prompt("Ingrese el titulo que reemplaza el actual titulo(" + titulo + ")");
                location.href = "actualizar.jsp?id=" + id + "&titulo=" + titulo + "&ntitulo=" + ntitulo;
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
        <h1>REALIZAR UNA CONSULTA EN LA TABLA , ACTUALIZAR (titulo) O ELIMINAR UN REGISTRO (id).</h1>
        <p style="color:darkblue;font-weight:bold;">Instrucciones: 
            <br>
            1. Para eliminar , de click sobre el id de la fila que desea eliminar<br>
            2. Para actualizar, de click sobre el titulo en la fila que desea actualizar(deberá ingresar el nuevo titulo)
        </p>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libros;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>Libro ID</th>
                <th>ISB</th>
                <th>Titulo</th>
                <th>Autor</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td onclick="eliminar('${row.id}');" 
                        onmouseover="this.style.backgroundColor='pink';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.id}"/>
                    </td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td onclick="actualizar('${row.id}', '${row.titulo}');"  
                        onmouseover="this.style.backgroundColor='green';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.titulo}"/>
                    </td>
                    <td><c:out value = "${row.autor}"/></td>
                </tr>
            </c:forEach>
        </table>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
