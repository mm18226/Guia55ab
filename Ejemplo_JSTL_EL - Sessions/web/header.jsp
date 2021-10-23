<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" width="100%" style="text-align: center;">
    <tr>
        <td>
            APP EJEMPLO
        </td>
        <td>
            SISTEMA DE REGISTRO DE PERSONAS<br>
            <b style="color:red;">${sessionScope.nombre}</b>
        </td>
        <td>
    
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <span style="color:blue;font-size:5mm;">
                  Usuario: ${sessionScope.user}</span><br>
                  <a href="logout.jsp">Logout</a>
              </c:if>
          </c:if>
        
   
    <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
          <span style="color:brown;font-size:5mm;">
              <a href="login.jsp">Login</a>
        </span>
    </c:if>
</td>
</tr>    
</table>
