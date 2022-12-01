<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 01/12/2022
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<h3>Chỉnh sửa sản phẩm</h3>
<c:if test="${mess!=null}">
    <p style="color: blue">${mess}</p>
</c:if>
<form method="post">
    <pre>Tên sản phẩm:  <input value="${product.getName()}" type="text" name="name"></pre>
    <pre>Giá :          <input value="${product.getPrice()}" type="text" name="price"></pre>
    <pre>Mô tả:         <input value="${product.getDescribe()}" type="text" name="describe"></pre>
    <pre>Nhà sản xuất:  <input value="${product.getProducer()}" type="text" name="producer"></pre>
    <pre>               <button style="background-color: #5c9be3">Cập nhật</button></pre>
</form>
<a href="/product">< Quay lại trang Danh sách sản phẩm</a>
</body>
</html>
