<%-- 
    Document   : login
    Created on : Sep 26, 2016, 8:58:16 PM
    Author     : Nguyen
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="a.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="js/huy.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/index.js"></script>
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
            CategoryDAO categoryDAO = new CategoryDAO();
        %>
<div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">
    	<div id="site_title"><a href="index.jsp">Floral Shop</a></div>
        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
           		<li><a href="products.jsp">Products</a>
                    <ul>
                        <%
                            for(Category c: categoryDAO.getListCategory()){
                        %>    
                            <li><a href="product.jsp?category=<%=c.getCategoryID()%>"><%= c.getCategoryName()%></a></li>
                        <%
                            }
                        %>
                    </ul>
                </li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="customer.jsp">Customer</a></li>
                <li><a class="selected" href="${pageContext.request.contextPath}/ControllerCustomers?action=Logout">
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
		<h2>Login</h2>
                <form action="ControllerCustomers">
                        <div>
                            <input type="text" name="txtUser" placeholder="Username" value="" required="" id="username" />
                        </div>
                        <div>
                            <input type="password" name="txtPass" placeholder="Password" value="" required="" id="password" />
                        </div>
                        <div>
                            <input type="submit" value="Login" name="action" />
                            <a href="#">Register</a>
                        </div>
                </form><!-- form -->
                <div class="button">
                        <a href="#">Download source file</a>
                </div><!-- button -->
        <div class="blank_box">
        	<a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
        </div>  
        <div class="cleaner"></div>  
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
