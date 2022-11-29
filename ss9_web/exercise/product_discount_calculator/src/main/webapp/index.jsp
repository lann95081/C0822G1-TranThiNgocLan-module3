<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 29/11/2022
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<div style="margin-left: 440px;border: 1px solid;width: 600px">
    <h2 style="text-align: center">Calculator Discount Product</h2>
    <form method="post" action="/Calculator">
        <label style="margin: 30px">Product Description: </label>
        <input type="text" name="description" value="Senpai" style="margin-left: 32px;margin-top: 20px"/><br/>
        <label style="margin: 30px">Product Price (usd): </label>
        <input type="number" name="price" value="0" style="margin-left: 37px;margin-top: 20px"/><br/>
        <label style="margin: 30px">Discount Percent (%): </label>
        <input type="number" name="percent" value="0" style="margin-left: 23px;margin-top: 20px"/><br/>
        <input type="submit" id="submit" value="Calculate Discount" style="margin-left: 240px;margin-top: 20px"/><br/>
    </form>
</div>
</body>
</html>
