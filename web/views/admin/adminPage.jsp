<%-- 
    Document   : login
    Created on : May 4, 2023, 6:43:25 PM
    Author     : ADMIN
--%>

<%@page import="DAO.SQLDataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<%
    String username ="";
    HttpSession httpSession = request.getSession();
    Object obj = httpSession.getAttribute("username");
    if (obj!=null)
    {
        username = String.valueOf(obj);
    }
    else
    {
        response.sendRedirect("index");
    }
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>KOPPEE - Coffee Shop HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="assets/css/style.min.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid p-0 nav-bar">
        <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
            <a href="index" class="navbar-brand px-lg-4 m-0">
                <h1 class="m-0 display-4 text-uppercase text-white">KOPPEE</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav ml-auto p-4">
                    <a href="index" class="nav-item nav-link">Home</a>
                    <a href="#" class="nav-item nav-link active">Menu</a>
                    <a href="booking-detail" class="nav-item nav-link">Booking</a>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 position-relative overlay-bottom">
        <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5" style="min-height: 400px">
            <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Menu Manager</h1>
            <div class="d-inline-flex mb-lg-5">
                <p class="m-0 text-white"><a class="text-white" href="">Home</a></p>
                <p class="m-0 text-white px-2">/</p>
                <p class="m-0 text-white">Menu Manager</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Menu Start -->
    <div class="container-fluid pt-5">
        <div class="container">
    <form action="/MVC_CuoiKy_Coffee_Shop/up-prod-to-db" method = "post" enctype="multipart/form-data">
        <label for="fTsp" style="width: 120px; display: inline-block;">Tên coffee: </label>
        <input type="text" id="fTsp" name="fTsp" /> <br />
        <br />
        <label for="fDonGia" style="width: 120px; display: inline-block;">Đơn giá: </label>
        <input type="text" id="fDonGia" name="fDonGia"/> <br />
        <br />
        <label for="fImg" style="width: 120px; display: inline-block;">Hình ảnh: </label>
        <input type="file" id="fimg" name="fimg"/> <br />
        <br />
        <label for="fMota" style="width: 120px; display: inline-block;">Mô tả: </label>
        <input type="text" id="fMota" name="fMota"/> <br /><br />
        <label for="fImg" style="width: 120px; display: inline-block;">Loại coffee:  </label>
        
        <%!SQLDataAccess con = new SQLDataAccess();
        String SQL;
        ResultSet rs;
        %>
            <select id ="fLoai" name = "fLoai">
                <%
                    SQL="Select * from tbLoaiCoffee";
                    rs = con.getResultSet(SQL);
                while(rs.next())
                {
                out.print("<option value='"+rs.getInt("maLoai")+"'>"+rs.getString("tenLoai")+"</option>");
                }
                %>
            </select>
            <br />
            <br />
            <input type="submit" value="submit"/>
    </form>
            <table style="width: 100%; border: 1px solid #000; border-collapse: collapse; margin-top: 16px">
                <tr>
                    <th style="border: 1px solid #000;">Mã sản phẩm</th>
                    <th style="border: 1px solid #000;">Tên sản phẩm</th>
                    <th style="border: 1px solid #000;">Đơn giá</th>
                    <th style="border: 1px solid #000;">Hình ảnh</th>
                    <th style="border: 1px solid #000;">Mô tả</th>
                    <th style="border: 1px solid #000;">Mã loại</th>
                    <th style="border: 1px solid #000;">Xoá</th>
                </tr>
                <%
                    try {
                            SQL="Select * from tbMenu";
                            rs = con.getResultSet(SQL);
                            while(rs.next()) {
                %>
                <tr>
                    <td style="border: 1px solid #000;"><%= rs.getInt("maSP")%></td>
                    <td style="border: 1px solid #000;"><%= rs.getString("tenSP")%></td>
                    <td style="border: 1px solid #000;"><%= rs.getInt("donGia")%></td>
                    <td style="border: 1px solid #000;"><%= rs.getString("hinhAnh")%></td>
                    <td style="border: 1px solid #000;"><%= rs.getString("moTa")%></td>
                    <td style="border: 1px solid #000;"><%= rs.getInt("maLoai")%></td>
                    <td style="border: 1px solid #000;"><a href="del-prod?maSP=<%=rs.getInt("maSP")%>">x</a></td>
                </tr>
                 <% }
                    }
                    catch (Exception e) {
                        }
                 %>
            </table>
        </div>
    </div>
    <!-- Menu End -->


    <!-- Footer Start -->
    <div class="container-fluid footer text-white mt-5 pt-5 px-0 position-relative overlay-top">
        <div class="row mx-0 pt-5 px-sm-3 px-lg-5 mt-4">
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Get In Touch</h4>
                <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                <p class="m-0"><i class="fa fa-envelope mr-2"></i>info@example.com</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Follow Us</h4>
                <p>Amet elitr vero magna sed ipsum sit kasd sea elitr lorem rebum</p>
                <div class="d-flex justify-content-start">
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-lg btn-outline-light btn-lg-square" href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Open Hours</h4>
                <div>
                    <h6 class="text-white text-uppercase">Monday - Friday</h6>
                    <p>8.00 AM - 8.00 PM</p>
                    <h6 class="text-white text-uppercase">Saturday - Sunday</h6>
                    <p>2.00 PM - 8.00 PM</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="text-white text-uppercase mb-4" style="letter-spacing: 3px;">Newsletter</h4>
                <p>Amet elitr vero magna sed ipsum sit kasd sea elitr lorem rebum</p>
                <div class="w-100">
                    <div class="input-group">
                        <input type="text" class="form-control border-light" style="padding: 25px;" placeholder="Your Email">
                        <div class="input-group-append">
                            <button class="btn btn-primary font-weight-bold px-3">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-center text-white border-top mt-4 py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
            <p class="mb-2 text-white">Copyright &copy; <a class="font-weight-bold" href="#">Domain</a>. All Rights Reserved.</a></p>
            <p class="m-0 text-white">Designed by <a class="font-weight-bold" href="https://htmlcodex.com">HTML Codex</a></p>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
