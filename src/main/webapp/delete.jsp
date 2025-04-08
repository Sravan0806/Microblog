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
<script type="text/javascript">
<%
Cookie c[]=request.getCookies();
//name in blogs table
String username=c[1].getValue();
//id in blogs table
String id=request.getParameter("del");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password");
Statement st = con.createStatement(); 
String res=String.format("delete from blogs where id='%s' and name='%s'",id,username);
st.executeUpdate(res);
//redirect to website 
out.println("window.open('http://localhost:8080/Wpcc/website.jsp','_self');");
%>
</script>

</body>
</html>