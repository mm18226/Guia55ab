<%-- 
    Document   : frmupdate
    Created on : Oct 19, 2021, 4:42:57 PM
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
        <title>Actualizar libro</title>
    </head>
    <body>
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
        <c:set var="isbn" value="${param.isbn}"/>
        <c:set var="titulo" value="${param.titulo}"/>
        <c:set var="autor" value="${param.autor}"/>
        <c:set var="editorial" value="${param.editorial}"/>
        
        <form action="update.jsp" method="post" name="Actualizar">
            <table>
                <tr>
                    <td>ISBN: <input type="text" name="isbn" id="isbnAvalue" value="${isbn}" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>Título: <input type="text" name="titulo" id="tituloA" value="${titulo}" size="50"/></td>
                </tr>
                <tr>
                    <td>Autor: <input type="text" name="autor" id="autorA" value="${autor}" size="50"/></td>
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
                    <td><input  class="boton" type="SUBMIT" value="Actualizar" />
                    </td>
                </tr>
                </tr>
            </table>
        </form>
        <br><br>
    </body>
</html>
