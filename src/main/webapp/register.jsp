<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> tables= new ArrayList<>(); 
try { 
	String a=request.getParameter("name");
	String b=request.getParameter("password");
	String c=request.getParameter("gender");
	String yyyy=request.getParameter("yyyy");
	String mm=request.getParameter("mm");
	String dd=request.getParameter("dd");
	String dob=yyyy+"-"+mm+"-"+dd;
	String d=request.getParameter("phone");
	String e=request.getParameter("mail");
	String f1=request.getParameter("adrs1");
	String f2=request.getParameter("adrs2");
	String f3=request.getParameter("adrs3");
	String f=f1+","+f2+","+f3;
	String g=request.getParameter("photodata");
	String h="";
	String i="";
	
Class.forName("com.mysql.cj.jdbc.Driver"); 


Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password");
Statement st = con.createStatement(); 
ResultSet r=st.executeQuery("select * from userdata");
while(r.next()){
	//stores results in array
	//array name tables ==>storing username
	tables.add(r.getString(1));
}


//checks whether user name exists or not
if (tables.contains(a)){
	out.println("<script>alert('Username Already Exists');</script>");
	//redircting to index page
	out.println("<script>window.open('http://localhost:8080/Wpcc/index.html','_self')</script>");
}
else{
	con=DriverManager.getConnection( 
	"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password");
	st = con.createStatement(); 
	//stores userdata into table USERDATA
	String res=String.format("INSERT INTO userdata VALUES ('%s', '%s', '%s','%s','%s','%s','%s','%s','%s','%s')",a,b,c,dob,d,e,f,g,h,i);
	st.executeUpdate(res); 
	out.println("<script>alert('Registered sucessfully');</script>");
	con.close(); 
	out.println("<script>window.open('http://localhost:8080/Wpcc/index.html','_self')</script>");
}
con.close();
} catch (Exception e) { 
System.err.println("Got an exception! "); 
System.err.println(e.getMessage()); 
} 
%>
</body>
</html>