<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 30/11/2022
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form method="post" action="/calculate">
    <fieldset>
      <legend>Calculator</legend>
      <table>
        <tr>
          <td>First operand:</td>
          <td><input name="firstOperand" type="text" placeholder="Input first operand"></td>
        </tr>
        <tr>
          <td>Operator:</td>
          <td>
            <select name="operator">
              <option value="+">Addition</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second operand:</td>
          <td><input name="secondOperand" type="text" placeholder="Input second operand"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculate"></td>
        </tr>
      </table>
    </fieldset>
  </form>
  </body>
</html>
