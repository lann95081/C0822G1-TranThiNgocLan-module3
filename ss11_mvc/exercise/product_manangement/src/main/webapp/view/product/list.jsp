<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 01/12/2022
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Products List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h3 class="text-center">DANH SÁCH SẢN PHẨM</h3>

<p class="text-center my-3"><a href="/product?action=create">
    <button class="btn btn-info btn-sm">+ Thêm sản phẩm mới</button>
</a></p>

<form action="/product" class="text-center">
    <input type="text" name="nameSearch" placeholder="Nhập tên sản phẩm">
    <button type="submit" name="action" value="search" class="btn btn-secondary btn-sm">Tìm kiếm</button>
</form>

<table class="table table-striped ms-5" style="width: 94%" border="1">
    <tr>
        <th>Id</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th></th>
        <th></th>
        <th></th>
    </tr>

    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">
                <button class="btn btn-primary btn-sm">Chỉnh sửa</button>
            </a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">
                <button class="btn btn-danger btn-sm">Xóa</button>
            </a></td>
            <td><a href="/product?action=view&id=${product.getId()}">
                <button class="btn btn-success btn-sm">Thông tin</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

