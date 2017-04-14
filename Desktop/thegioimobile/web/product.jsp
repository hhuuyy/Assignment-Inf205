<%-- 
    Document   : products
    Created on : Sep 26, 2016, 8:58:37 PM
    Author     : Nguyen
--%>

<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="a.png"/>
        <script src="js/huy.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <style>
            html, body {
                height: 100%;
                width: 100%;
                padding: 0;
                margin: 0;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: center;
            }
            th {
                color: black;
                height: 40px;
                border-bottom: 1px solid #ddd;
                font-size: 20px;
            }
            td {
                height: 30px;
                vertical-align: bottom;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                color: white;
            }
            .full{
                margin: 0 auto;
                width: 900px;
                padding-left: 90px;
            }
            .bg{
                width: 100%;
                height: 100%;
                background: url(image/1920x1080a.jpg) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            h1{
                padding-left: 340px;
            }input[type=text] {
                width: 165px;box-sizing: border-box;border: 2px solid #ccc;background: none;color: white;
                font-size: 16px;background-position: 10px 10px;background-repeat: no-repeat;
                padding: 5px 5px 5px 29px;-webkit-transition: width 0.4s ease-in-out;transition: width 0.4s ease-in-out;font-family: "Open Sans";
            }
            input[type=text]:focus {
                width: 76.4%;
            }
            .button_sliding_bg {
                color: #FFF;
                background: #cccc00;
                padding: 5px 5px;
                margin: 5px;
                font-family: 'OpenSansBold', sans-serif;
                font-size: 14px;
                font-weight: bold;
                letter-spacing: 1px;
                text-transform: uppercase;
                border-radius: 2px;
                border: none;
                display: inline-block;
                text-align: center;
                cursor: pointer;
                box-shadow: inset 0 0 0 0 #C14800;
                    -webkit-transition: all ease 0.8s;
                    -moz-transition: all ease 0.8s;
                    transition: all ease 0.8s;
            }
            .button_sliding_bg:hover {
                box-shadow: inset 0 100px 0 0 #C14800;
            }
            button {
                height: 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;
                margin: 4px 2px;-webkit-transition-duration: 0.4s; /* Safari */transition-duration: 0.4s;
                cursor: pointer;background: none;color: white;
                border: 2px solid #4CAF50;font-weight: bold;font-family: "Open Sans";
            }
            button:hover {
                background-color: #4CAF50; /* Green */
                color: white;
            }
            .button_example{
                border-color:#cccc00;border-width: 1px 1px 1px 15px;border-style: solid; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;font-size:12px;font-family:arial, helvetica, sans-serif; padding: 2px 5px 3px 5px; text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF;
             background-color: #66cc00; background-image: -webkit-gradient(linear, left top, left bottom, from(#66cc00), to(#9174ED));
             background-image: -webkit-linear-gradient(top, #66cc00, #9174ED);
             background-image: -moz-linear-gradient(top, #66cc00, #9174ED);
             background-image: -ms-linear-gradient(top, #66cc00, #9174ED);
             background-image: -o-linear-gradient(top, #66cc00, #9174ED);
             background-image: linear-gradient(to bottom, #66cc00, #9174ED);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#66cc00, endColorstr=#9174ED);
            }

            .button_example:hover{
             border-top-color: #cccc00;border-right-color: #cccc00;border-bottom-color: #cccc00;border-left-color: #cccc00;border-width: 1px 15px 1px 1px;border-style: solid;
             background-color: #66cc00; background-image: -webkit-gradient(linear, left top, left bottom, from(#66cc00), to(#9174ED));
             background-image: -webkit-linear-gradient(top, #66cc00, #9174ED);
             background-image: -moz-linear-gradient(top, #66cc00, #9174ED);
             background-image: -ms-linear-gradient(top, #66cc00, #9174ED);
             background-image: -o-linear-gradient(top, #66cc00, #9174ED);
             background-image: linear-gradient(to bottom, #66cc00, #9174ED);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#66cc00, endColorstr=#9174ED);
            }
            .ft{
                padding-right: 90px;
            }
        </style>
            <meta name="keywords" content="" />
            <meta name="description" content="" />
            <link href="templatemo_style.css" rel="stylesheet" type="text/css" />

            <link rel="stylesheet" href="css/orman.css" type="text/css" media="screen" />
            <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

            <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

            <script type="text/javascript" src="js/jquery.min.js"></script>
            <script type="text/javascript" src="js/ddsmoothmenu.js">

            /***********************************************
            * Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
            * This notice MUST stay intact for legal use
            * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
            ***********************************************/

            </script>

            <script type="text/javascript">

            ddsmoothmenu.init({
                    mainmenuid: "templatemo_menu", //menu DIV id
                    orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                    classname: 'ddsmoothmenu', //class added to menu's outer DIV
                    //customtheme: ["#1c5a80", "#18374a"],
                    contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })

            function clearText(field)
            {
                if (field.defaultValue == field.value) field.value = '';
                else if (field.value == '') field.value = field.defaultValue;
            }

            </script>


    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            String code = "";
            if(request.getParameter("category")!= null){
                code = request.getParameter("category");
            }
            Cart cart = (Cart)session.getAttribute("cart");
            if(cart == null){
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div id="templatemo_wrapper_sp">
        <div id="templatemo_header_wsp">
                <div id="templatemo_header" class="header_subpage">
                <div id="site_title"><a href="index.jsp">Floral Shop</a></div>
                <div id="templatemo_menu" class="ddsmoothmenu">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="products.jsp">Products</a></li>
                        <li><a href="cart.jsp">Cart</a></li>
                        <li><a href="customer.jsp">Customer</a></li>
                        <li><a href="${pageContext.request.contextPath}/ControllerCustomers?action=Logout">
                            <%
                                if (session.getAttribute("USER") != null){
                                    out.print("Logout");
                                }else{
                                    out.print("Login");
                                }    
                            %>
                        </a></li>
                        <li><a href="signup.jsp">Sign Up</a></li>
                        <li><a>Hello: ${USER}</a></li>
                    </ul>
                    <div id="templatemo_search">
                        <form action="ControllerProducts" method="get">
                                <input type="text" value="" name="txtTenSP" id="keyword" title="keyword" 
                                       onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" placeholder="Search name" />
                                <input type="submit" name="action" value="Search" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
                        </form>
                    </div>
                    <br style="clear: left" />
                </div> <!-- end of templatemo_menu -->

            </div> <!-- END of header -->
        </div> <!-- END of header wrapper -->
        <div id="templatemo_main_wrapper">
        <div id="templatemo_main">
                <div id="sidebar" class="left">
                <div class="sidebar_box"><span class="bottom"></span>
                    <h3>Categories</h3>   
                    <div class="content"> 
                        <ul class="sidebar_list">
                            <li><a href="#">OPPO F1S</a></li>
                            <li><a href="#">SAMSUNG</a></li>
                            <li><a href="#">IPHONE 6S</a></li>
                            <li><a href="#">IPHONE 6</a></li>
                            <li><a href="#">NOKIA LUMIA</a></li>
                            <li><a href="#">SONY</a></li>
                        </ul>
                    </div>
                </div>
                <div class="sidebar_box"><span class="bottom"></span>
                    <h3>Weekly Special</h3>   
                    <div class="content special"> 
                        <img src="images/templatemo_image_01.jpg" alt="Flowers" />
                        <a href="#">OPPO F1S</a>
                        <p>
                                Price:
                            <span class="price normal_price">$160</span>&nbsp;&nbsp;
                            <span class="price special_price">$100</span>
                        </p>
                    </div>
                </div>
            </div>

            <div id="content" class="right">
                        <h2>Products</h2>
                        <%
                          for(Product p: productDAO.getListProductByCategory(code)){
                        %>
                        <div class="product_box">
                            <a href="detail.jsp?code=<%=p.getCode()%>"><img src="<%=p.getImage()%>" alt="<%=p.getName() %>" width="165" height="165" /></a>
                                <h3><%=p.getName() %></h3>
                            <p class="product_price">$<%=p.getPrice() %></p>
                            <p class="add_to_cart">
                                <a href="detail.jsp?code=<%=p.getCode()%>">Detail</a>
                                <a href="CartServlet?command=plus&code">Add to Cart</a>
                            </p>
                        </div>
                        <%
                            }
                        %>
                <div class="cleaner h20"></div>
                <div class="blank_box">
                        <a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
                </div>    
            </div>
            <div class="cleaner"></div>
        </div> <!-- END of main -->
        </div> <!-- END of main wrapper -->

        <div id="templatemo_footer_wrapper">
        <div id="templatemo_footer">
                <div class="footer_left">
                <a href="#"><img src="images/1311260370_paypal-straight.png" alt="Paypal" /></a>
                <a href="#"><img src="images/1311260374_mastercard-straight.png" alt="Master" /></a>
                <a href="#"><img src="images/1311260374_visa-straight.png" alt="Visa" /></a>
            </div>
                <div class="footer_right">
                    <p><a href="index.jsp">Home</a> | <a href="products.jsp">Products</a> | <a href="about.jsp">About</a> | <a href="customer.jsp">Customer</a> | <a href="login.jsp">Login</a> | <a href="signup.jsp">Register</a></p>
                    <p>Copyright © 2084 <a href="#">PS04600</a></p>
                </div>
            <div class="cleaner"></div>
        </div> <!-- END of footer -->
        </div> <!-- END of footer wrapper -->
        </div>

    </body>
</html>
