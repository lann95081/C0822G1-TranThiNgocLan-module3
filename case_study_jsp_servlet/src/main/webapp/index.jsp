<%--
  Created by IntelliJ IDEA.
  User: tranthingoclan
  Date: 03/12/2022
  Time: 09:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%--  <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<div>
    <!--Header-->
    <div class="row" style="background-color: whitesmoke; padding: 20px">
        <div class="col-lg-3">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
                 style="width: 100px; margin-left: 70px">
        </div>
        <div class="col-lg-9 pt-5">
            <div class="row" style="font-family: 'Times New Roman'">
                <div class="col-lg-4">
                    <span style="text-align: center; color: #1e2125 ">
                        103 - 105 Vo Nguyen Giap Street,
                        Khue My Ward, Ngu Hanh Son District,
                        Danang City, Vietnam
                    </span>
                    <p>7,0 km from Danang Airport</p>
                </div>
                <div class="col-lg-5">
                    <p style="text-align: center; color: #1e2125">
                        84-236-3847 333/888
                        <br>
                        reservation@furamavietnam.com
                    </p>
                </div>
                <div class="col-lg-3">
                    <p style="color: #1e2125">Trần Thị Ngọc Lan</p>
                </div>
            </div>
        </div>
    </div>

    <!--    Navbar-->
    <div class="row" style="background: #046056; height: 60px; text-align: center">
        <nav class="navbar navbar-expand-lg" style="background: #046056">
            <div class="collapse navbar-collapse container-fluid" id="navbarNavAltMarkup">
                <div class="col-lg-1"></div>
                <div class="navbar-nav col-lg-8">
                    <div>
                        <button type="button" class="btn btn-close-white">
                            <a href="/index.jsp">HOME</a>
                        </button>
                    </div>
                    <div style="margin-left: 30px">
                        <button type="button" class="btn btn-close-white">
                            <a href="/employee">EMPLOYEE</a>
                        </button>
                    </div>
                    <div style="margin-left: 30px">
                        <button type="button" class="btn btn-close-white">
                            <a href="/customer">CUSTOMER</a>
                        </button>
                    </div>
                    <div style="margin-left: 30px">
                        <button type="button" class="btn btn-close-white">
                            <a href="/facility">SERVICE</a>
                        </button>
                    </div>
                    <div style="margin-left: 30px">
                        <button type="button" class="btn btn-close-white">
                            <a href="/contract">CONTRACT</a>
                        </button>
                    </div>
                </div>
                <div class="col-lg-3">
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success text-white" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <!--    Main Content-->
    <div class="row">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-10">
            <img src="https://thodiavn24h.com/wp-content/uploads/2020/05/4-8.png" style="width: 100%"/>
        </div>
    </div>

    <!--    Footer-->
    <div class="row" style="background: #046056">
        <div class="col-lg-2"></div>
        <div class="col-lg-3" style="background-color: #fdfdfe; color: black">
            <h2 style="color: #cbbe73; font-family: 'Al Nile'; margin-top: 30px; margin-left: 30px ">
                How to Get to Us
            </h2>
            <p style="font-family: Times New Roman; margin-left: 30px">
                Furama is a premier base for exploring one of Asia’s most exciting new destinations.
                Just a short drive from Danang lay four UNESCO-listed World Heritage Sites
            </p>
            <h4 style="color: #cbbe73; font-family: 'Al Nile'; margin-top: 30px; margin-left: 30px ">
                Local Places
            </h4>
            <ol style="color: black; font-family: Times New Roman">
                <li>The former imperial city of HUE</li>
                <hr style="margin-top: 2px">
                <li>The ancient Hoi An</li>
                <hr style="margin-top: 2px">
                <li>Champa civilization, My Son</li>
                <hr style="margin-top: 2px">
                <li>Phong Nha Caves</li>
            </ol>
        </div>
        <div class="col-lg-3" style="margin-top: 30px">
            <a href="https://furamavietnam.com/activities/" style="color: #fdfdfe; font-family: 'Al Nile'">New</a>
            <br>
            <a href="https://furamavietnam.com/furama-resort-danang-rack-rate/"
               style="color: #fdfdfe;font-family: 'Al Nile'">Rack Rate</a>
            <br>
            <a href="https://furamavietnam.com/lifestyle-blog/" style="color: #fdfdfe; font-family: 'Al Nile'">Lifestyle
                Blog</a>
            <br>
            <a href="https://furamavietnam.com/work-with-us/" style="color: #fdfdfe; font-family: 'Al Nile'">Work with
                us</a>
            <br>
            <a href="https://furamavietnam.com/contact/" style="color: #fdfdfe; font-family: 'Al Nile'">Contact us</a>
            <img style="margin-top: 150px"
                 src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
                 alt="Ariyana Tourism Complex" width="500px;"></div>
        <div class="col-lg-4">
            <h4 style="color: #cbbe73; font-family: 'Al Nile'; margin-top: 30px">Contact US</h4>
            <span class="d-flex"
                  style="color: darkgray; margin-top: 20px; margin-left: 30px; font-family: 'Times New Roman'">
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son
                District, Danang City, Vietnam
                </span>
            <p style="color: darkgray; margin-top: 20px; margin-left: 30px; font-family: 'Times New Roman'">
                Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
            </p>
            <span class="d-flex"
                  style="color: darkgray; margin-top: 20px; margin-left: 30px; font-family: 'Times New Roman'">
                Email: reservation@furamavietnam.com * www.furamavietnam.com GDS Codes: Amadeus-GD DADFUR,
                Galileo/Apollo-GD 16236, Sabre-GD 032771, Worldspan- GD DADFU</span>
            <hr>
            <p style="margin-left: 150px; margin-top: 30px; color: darkgrey">&copy; 2018 Furama Resort Danang.</p>
        </div>
    </div>
</div>
<%--<script src="../bootstrap/js/bootstrap.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>