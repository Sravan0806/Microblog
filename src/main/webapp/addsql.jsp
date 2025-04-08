<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*,java.util.Date,java.text.SimpleDateFormat,java.time.format.DateTimeFormatter,java.time.LocalDateTime" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Cookie c[]=request.getCookies();
 String username=c[1].getValue();
 //present time
 String nowtime=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
 //time in day month year format
 String FormatedDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern("E, MMM dd yyyy"));
 //heading,content
 String heading=request.getParameter("enhead");
 String content=request.getParameter("encon");
 %>
 
 <% 
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password"); 
Statement stmt=con.createStatement();
String res=String.format("insert into blogs values('%s','%s','%s','%s','%s')",nowtime,FormatedDate,heading,content,username);
stmt.executeUpdate(res);
con.close();
out.println(String.format("<script>alert('%s')</script>","blog posted sucessfully"));
out.println("<script>window.open('http://localhost:8080/Wpcc/website.jsp','_self')</script>");
 %>
</body>
</html>