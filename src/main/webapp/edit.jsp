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
String username=c[1].getValue();
String a=request.getParameter("editdate");
String b=request.getParameter("edithead");
String d=request.getParameter("editcon");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password");
Statement st = con.createStatement(); 
String res=String.format("update blogs set heading='%s' where name='%s' and id='%s' ",b,username,a);
st.executeUpdate(res);
res=String.format("update blogs set content='%s' where name='%s' and id='%s' ",d,username,a);
st.executeUpdate(res);
out.println("window.open('http://localhost:8080/Wpcc/website.jsp','_self');");
%>
</script>

</body>
</html>