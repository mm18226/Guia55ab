<%-- 
    Document   : index
    Created on : Oct 19, 2021, 4:41:10 PM
    Author     : migue
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <script>
            function actualizar(id, last)
            {
                var nlast = prompt("Ingrese el apellido que reemplaza el actual apellido(" + last + ")");
                location.href = "actualizar.jsp?id=" + id + "&last=" + last + "&nlast=" + nlast;
            }
            function eliminar(isbn)
            {
                alert("A continuación se eliminará el registro #"+isbn);
                location.href = "eliminar.jsp?isbn=" + isbn;
            }
        </script>
    </head>
    <body>
        <h1>Mantenimiento de libros</h1>
        <form action="insert.jsp" method="post" name="Insertar">
            <table>
                <tr>
                    <td>ISBN: <input type="text" name="isbn" id="isbnAvalue" value="" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>Título: <input type="text" name="titulo" id="tituloA" value="" size="50"/></td>
                </tr>
                <tr>
                    <td>Autor: <input type="text" name="autor" id="autorA" value="" size="50"/></td>
                </tr>
                <!--Lista para item 7-->
                <tr>
                    <td>
                        Seleccione La Editorial
                        <select name="editorial" id="editorialA">   
                            <option value="Planeta">Planeta</option> 
                            <option value="Ediciones Akal">Ediciones Akal</option>
                            <option value="Read & Co. Classics">Read & Co. Classics</option>
                            <option value="La galera SAU">La galera SAU</option>
                            <option value="Santillana">Santillana</option> 
                            <option value="Algani">Algani</option>   
                            <option value="Arcibel">Arcibel</option> 
                            <option value="Avenauta">Avenauta</option> 
                            <option value=" Males Herbes">Males Herbes</option>
                            <option value="Debolsillo">Debolsillo</option>
                            <option value="Calambur">Calambur</option>] 
                            <option value="Renacimiento">Renacimiento</option>]
                        </select>
                    </td>
                </tr>
                <!--Fin de la lista-->
                <tr>
                    <td><input  class="boton" type="SUBMIT" value="Insertar" />
                    </td>
                </tr>
                </tr>
            </table>
        </form>
        <br><br>
        <sql:query dataSource="${fuenteDatos}" var="result">
            select * from libro;
        </sql:query>
            <table border="1" width="75%" align="center"> 
                <thead>
                    <tr>
                        <th>ISBN</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Editorial</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td><c:out value="${row.isbn}"/></td>
                            <td><c:out value="${row.titulo}"/></td>
                            <td><c:out value="${row.autor}"/></td>
                            <td><c:out value="${row.editorial}"/></td>
                            <td>
                                <a href="frmupdate.jsp?isbn=${row.isbn}&titulo=${row.titulo}&autor=${row.autor}&editorial=${row.editorial}">Actualizar</a>
                                <a href="delete.jsp?isbn=${row.isbn}">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>
