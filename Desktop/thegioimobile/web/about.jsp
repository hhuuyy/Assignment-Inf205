<%-- 
    Document   : about
    Created on : Oct 13, 2016, 8:14:15 PM
    Author     : Nguyen
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="a.png"/>
        <script src="js/huy.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
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
                <li><a href="about.jsp" class="selected">About</a></li>
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
		<h2>About</h2>
        <p>Phận làm trai gõ phím bình thiên hạ. Thân anh hùng click chuột định giang sơn.</p>
        <div class="cleaner h20"></div>
        <div class="col col13">
            <h4>Address</h4>
        	<h6><strong>One</strong></h6>
            Nhơn Phúc - An Nhơn - Bình Định<br /><br />
            
			<strong>Phone:</strong> 0167-9877-983<br />
            <strong>Email:</strong> <a href="mailto:hellonguyenquochuy@gmail.com">hellonguyenquochuy@gmail.com</a> <br />
            
            <div class="cleaner h20"></div>
            
            <h6><strong>Two</strong></h6>
            622 Cộng Hòa - P13 - Tân Bình - TP.HCM<br /><br />
            
			<strong>Phone:</strong> 0167-9877-983<br />
            <strong>Email:</strong> <a href="mailto:huynqps04600@fpt.edu.vn">huynqps04600@fpt.edu.vn</a> <br />
		</div>
        <div class="col col23 no_margin_right">
        	<div class="map_border">
                    <iframe width="430" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.1064867119885!2d106.63883866100694!3d10.803155650296615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175295a5d0176a9%3A0xfc773949dbd8b630!2zNjIyIEPhu5luZyBIw7JhLCBwaMaw4budbmcgMTMsIFTDom4gQsOsbmgsIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1476364239776"></iframe>
                </div>
			
        </div>
        <div class="cleaner h40"></div>
        <div id="contact_form">
           <form method="post" name="contact" action="#">
           		<div class="col col13">
                
                    <label for="name">Name:</label> 
              		<input name="name" type="text" class="input_field" id="name" maxlength="40" />
                	<div class="cleaner h10"></div>
                    <label for="email">Email:</label> 
          			<input name="email" type="text" class="required input_field" id="email" maxlength="40" />
                	<div class="cleaner h10"></div>
                    <label for="phone">Phone:</label> 
        			<input name="phone" type="text" class="input_field" id="phone" maxlength="20" />
                	<div class="cleaner h10"></div>
                	
                
			 	</div>
                
                <div class="col col23 no_margin_right">
                    <label for="message">Message:</label> 
               	  	<textarea id="message" name="message" rows="0" cols="0" class="required"></textarea>
                    <div class="cleaner h10"></div>
                    <input type="submit" class="submit_btn left" name="submit" id="submit" value="Send" />
                    <input type="reset" class="submit_btn submit_right" name="reset" id="reset" value="Reset" />
				</div>
                
                
            </form>
        </div>
        <div class="cleaner h40"></div>        
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
