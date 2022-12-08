<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 07/12/2022
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Contract list</title>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/86/41/6d/86416d71cbd1e608a5304bb92fc235ea.png");
        }

        table {
            border: solid 3px;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="p-3">
    <h2 class="text-center fw-bold">CONTRACT LIST</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <c:if test="${mess!=null}">
    <c:if test="${check}">
    <div class="justify-content-center d-flex">
        <div class="alert alert-success alert-dismissible fade show w-50 text-center">
            <strong>${mess}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
    </c:if>

    <c:if test="${!check}">
    <div class="justify-content-center d-flex">
        <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
            <strong>${mess}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </div>
    </c:if>
    </c:if>

    <nav class="navbar navbar-expand-lg py-0 my-0">
        <div class="container-fluid">
            <a href="/contract?action=create">
                <button class="btn btn-success btn-outline-secondary btn-sm">
                    <span class="fa-solid fa-plus text-light h6 my-auto me-1"></span>
                    <span class="text-light"> Add new Contract</span>
                </button>
            </a>
        </div>
    </nav>

    <table id="contractTable" class="table table-light table-striped table-bordered">
        <thead>
        <tr class="table-dark text-light">
            <th class="text-center"><i class="fa-solid fa-dog"></i></th>
            <th>Facility</th>
            <th>Employee</th>
            <th>Customer</th>
            <th>Start day</th>
            <th>End day</th>
            <th>Deposit</th>
            <th>Total money</th>
            <th>Attach facility</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach varStatus="status" var="contract" items="${contractList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <c:forEach var="facility" items="${facilityList}">
                    <c:if test="${facility.facilityId == contract.facilityId}">
                        <td>${facility.facilityName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="employee" items="${employeeList}">
                    <c:if test="${employee.employeeId == contract.employeeId}">
                        <td>${employee.employeeName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="customer" items="${customerList}">
                    <c:if test="${customer.customerId == contract.customerId}">
                        <td>${customer.customerName}</td>
                    </c:if>
                </c:forEach>
                <td>${contract.startDate}</td>
                <td>${contract.endDate}</td>
                <td>${contract.deposit}</td>
                <td>${contract.totalMoney}</td>
                <td class="text-center">
                    <a href="/contract?action=add&id=${contract.contractId}" data-bs-toggle="modal"
                       data-bs-target="#addAttachFacility"
                       onclick="addAttachFacility('${contract.getContractId()}')">
                        <button class="btn btn-primary btn-outline-secondary btn-sm">
                            <span class="fa-solid fa-plus text-light h6 m-auto"></span>
                        </button>
                    </a>
                    <a href="/contract?action=show&id=${contract.contractId}" data-bs-toggle="modal"
                       data-bs-target="#showAttachFacility" onclick="showAttachFacility('${contract.getContractId()}')">
                        <button class="btn btn-primary btn-outline-secondary btn-sm ms-2">
                            <span class="text-light m-auto">Attach facility list</span>
                        </button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--  Phân trang--%>
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#contractTable').dataTable({
                "dom": 'lrtip',
                "lengthChange": false,
                "pageLength": 7
            });
        });
    </script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous">
</script>
</html>
