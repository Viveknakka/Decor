<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*,jakarta.servlet.*,java.util.*" %>
<%@ page import="com.example.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DecorX</title>
 <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

</head>
<body>
<%!ArrayList<Product> plist=new ArrayList<Product>(); %>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vivek597", "nakka597");
    Statement st = conn.createStatement();
    
    // Your database operations here
    ResultSet rs=st.executeQuery("select *from products");
    
    while(rs.next())
    {
    	plist.add(new Product(rs.getInt("pid"),rs.getString("pname"),rs.getDouble("price"),rs.getInt("rating"),rs.getString("imagepath"),rs.getString("description")));
    }

    conn.close(); 
} catch (Exception e) {
    e.printStackTrace();
}%>


<nav >
        <div class="navbar">
            <label id="logo">DecorX</label>
            <a href="#home">Home</a>
            <a href="./about.html">About</a>
            <a href="./contact.html">Contact</a>
            <a href="./yourorders.jsp">Your Orders</a>
            <div class="dropdown">
              <button class="dropbtn">Designs 
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <div class="dchoice" onclick="display('Marriage')">Marriage</div>
                <div class="dchoice" onclick="display('Halidi')">Halidi</div>
                <div class="dchoice" onclick="display('Reception')">Reception</div>
                <div class="dchoice" onclick="display('Birthday')">Birthday</div>
                <div class="dchoice" onclick="display('Engagement')">Engagement</div>
                <div class="dchoice" onclick="display('others')">others</div>
              </div>
            </div>
            <div class="dropdown">
              <button class="dropbtn">
                   <i class="fa-solid fa-user-large ac"></i>Account
                   <i class="fa fa-caret-down"></i>
               </button>
              <div class="dropdown-content" >
              <%if(session.getAttribute("username")==null) {%>
                <div class="dchoice" onclick="login('user')"><a href="./userlogin.html">User</a></div>
                <div class="dchoice" onclick="login('admin')"><a href="./adminlogin.html">Admin</a></div>
                <%} else{
                	String username=(String)session.getAttribute("username");
                	%>
                <div class="dchoice" style="height:30px;" >-<%=username %></div>
                <div class="dchoice"><a href="./profile.jsp">Profile</a></div>
                <div class="dchoice"><a href="./yourorders.jsp">Orders</a></div>
                <div class="dchoice"><a href="./yourcart.jsp">Cart</a></div>
                <div class="dchoice"><a href="./logout.jsp">Logout</a></div>
                  <%} %>
               </div>
             </div>
         </div> 
    </nav>


    <main>
      <div id="welcome">
        <h1>Welcome to DecorX... </h1>
       <i>
        <p>
            Welcome to DecorX, your premier destination for exquisite event decorations.
             At DecorX, we understand that every event is unique, and the right décor sets the stage for unforgettable moments.
              Whether you're planning a wedding, corporate gathering, birthday celebration, or any special occasion, our expert decorators are here to transform your vision into reality.
          </p>
          <p>
            Discover a world of creativity and sophistication as you explore our curated collection of themes, color schemes, and décor elements.
             From elegant floral arrangements to trendy modern setups, our wide range of options ensures that your event reflects your personal style and leaves a lasting impression on your guests.
          </p>
          <p>
            Booking with us is a seamless experience. Simply browse through our portfolio, select your preferred decorations, and let us handle the rest.
             Our team of skilled professionals is committed to bringing your event dreams to life, ensuring every detail is perfect.
          </p>
          <p>Why settle for ordinary when you can have extraordinary? Elevate your event with DecorX and turn moments into memories that will be cherished forever. 
            Explore our offerings, and start planning the event of a lifetime today.
          </p>
          </i>
        </div>
         <div id="cardContainer" >
          <iframe id="welvideo1" width="fit-content" height="315" src="https://www.youtube.com/embed/mPeStYrhFlQ?si=Z1EJ-9R7CVazgW6e" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          <iframe id="welvideo2" width="fit-content" height="315" src="https://www.youtube.com/embed/tPier7wkm7w?si=jupoXEVUuvDo7StG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
          <%
            
             for(Product p:plist){
            	 
            	 request.setAttribute("pid", p.getPid());
            	 out.println("<div class='card' >");
            	 out.println("<h1>"+p.getPname()+" Design</h1>");
            	 out.println("<img src='"+p.getImgPath()+"' style='width:300px;height:300px'>");
            	 out.println("<br><br>Rating:"+p.getRating()+"/5");
            	 out.println("<br><br>Price: ₹"+p.getPrice()+"<br><br>");
            	 out.println("<button><a href='./addCart.jsp'>Add to Cart</button>");
            	 out.println("<button><a href='./orderForm.html' target='_blank' style='text-decoration:none;'>Order Now<a></button>");
            	 out.println("<br><br></div>");
            	
             }
          
          
          %>
         </div>
          
    </main>
    <footer >
     <div class="footer">

     </div>
    </footer>
    <script src="javascript/home.js"></script>

</body>
</html>