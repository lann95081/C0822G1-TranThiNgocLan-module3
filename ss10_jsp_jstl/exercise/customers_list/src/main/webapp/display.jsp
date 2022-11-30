<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 30/11/2022
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Display</title>
</head>
<body>
<h3>Danh sách khách hàng</h3>
<table style="text-align: center">
    <tr style="magin-top: solid 1px">
        <th>ID</th>
        <th>Name</th>
        <th>Day Of Birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td style="text-align: center">${customer.id}</td>
            <td>${customer.name}</td>
            <td style="text-align: center">${customer.dayOfBirth}</td>
            <td>${customer.address}</td>
            <td style="text-align: center"><img src="${customer.image}" width="100px" height="100px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
