<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Cookie c[]=request.getCookies();
String username=c[1].getValue();
var a=request.getParameter("dhead");
var b=request.getParameter("dcon");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password");
Statement st = con.createStatement(); 
String res=String.format("update userdata set heading='%s' where username='%s'",a,username);
st.executeUpdate(res);
res=String.format("update userdata set content='%s' where username='%s'",b,username);
st.executeUpdate(res);
out.println("<script>window.open('http://localhost:8080/Wpcc/website.jsp','_self');</script>");
%>
</body>
</html>