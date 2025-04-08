<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.awt.*"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.awt.event.*"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1", "chandan@123", "password");
	Statement st=con.createStatement();
	//checks whether user name and password matches or not
	String s =String.format("Select username,password from userdata where username='%s' and password='%s'",username,password);
    ResultSet rs = st.executeQuery(s); 
    
    
    //if rs.next() is empty moves to else part....
    //rs.next()is empty ==>false..
    //else True...
    if(rs.next()) {
       //creating cookie
       Cookie c1=new Cookie("username",username);
       response.addCookie(c1);
       //redirects to website page
       out.println("<script>window.open('http://localhost:8080/Wpcc/website.jsp','_self')</script>");
    }
    else{
    	out.println("<script>alert('Invalid credentials');</script>");
    	out.println("<script>window.open('http://localhost:8080/Wpcc/index.html','_self')</script>");
    }
       
	con.close();
	

} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
<input type="button" value='<%=password%>'>
</html>