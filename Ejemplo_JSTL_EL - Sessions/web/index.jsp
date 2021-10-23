<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<c:set var="pageId" value="Index" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Manejo de Sesiones/control de accesos a libros</title>
        <c:if test="${sessionScope.nivel eq 1}">
        <script>
            function insertar() {
                alert("A continuación debe ingresar los datos del libro.");
                var isb = prompt("Ingrese el ISB: ");
                var titulo = prompt("Ingrese el titulo: ");
                var autor = prompt("Ingrese el autor: ");
                location.href = "insertar.jsp?isb=" + isb + "&titulo=" + titulo + "&autor=" + autor;
            }

        </script>
        </c:if>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Parte IV Grupo 01 
            + EL (Expression Language) 
            <span style="color:blue;">+++Manejo de sesiones y variables de sesión. Control de acceso 
                a paginas y fragmentos de pagina.</span>
        </h1>
        <h2>Grupo: 01</h2>
        <ul>
            <li>
                <a href="consultar.jsp">Mostrar Listado Actual

                </a>                    
                <c:if test="${sessionScope.nivel eq 2}">(puede ACTUALIZAR & ELIMINAR)</c:if>
                </li>
            <c:if test="${sessionScope.nivel eq 1}">
                <li>
                    <a href="javascript:insertar();">Agregar y mostrar Listado Actualizado</a>
                </li>
            </c:if>
        </ul>
                <br><h2>OPCIONES PARA PROBAR</h2>
                <P>Como usuario anonimo puede consultar nada más, pero existen los niveles 0-solo consulta, 
                    1-agrega, 2-actualiza y eliminar, por lo que si quiere agregar, actualizar o borrar tiene dos opciones:
                <br><ol>
                    <li>Dar click a login en esta pagina index y luego ingresar uno de los siguientes usuarios<br>
                Registrador (inserta nada más), Corrector (actualiza), Borrador(elimina), <br>
                para todos la clave es: <b style="color:blue;">m1sm4</b>
                <br></li><li>
                Sin necesidar de ingresar usuario y clave puede dar click a los vinculos siguientes, y se cargará
                de manera automática el usuario del tipo respectivo.</P>
        <a href="nivel.jsp?n=1">User nivel 1(insertar)</a>---<a href="nivel.jsp?n=2">User nivel 2(actualizar & eliminar)</a>---
     ---<a href="nivel.jsp?n=0">User nivel 0(listar/consultar)</a>---
                    </li></ol>
    </body>
</html>
