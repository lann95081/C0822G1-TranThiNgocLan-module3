<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 30/11/2022
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h3>Result:</h3>
<c:choose>
    <c:when test="${param.operator == '+'}">
        <h4>${param.firstOperand} + ${param.secondOperand} = ${addition}</h4>
    </c:when>

    <c:when test="${param.operator == '-'}">
        <h4>${param.firstOperand} - ${param.secondOperand} = ${subtraction}</h4>
    </c:when>

    <c:when test="${param.operator == '*'}">
        <h4>${param.firstOperand} * ${param.secondOperand} = ${multiplication}</h4>
    </c:when>

    <c:when test="${param.operator == '/'}">
        <c:if test="${param.secondOperand == 0}">
            <h4>Can't divide by zero!</h4>
        </c:if>

        <c:if test="${param.secondOperand != 0}">
            <h4>${param.firstOperand} / ${param.secondOperand} = ${division}</h4>
        </c:if>
    </c:when>
</c:choose>
</body>
</html>
