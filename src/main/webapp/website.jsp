<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*,java.util.Date,java.text.SimpleDateFormat,java.time.format.DateTimeFormatter,java.time.LocalDateTime,com.mysql.cj.jdbc.result.ResultSetMetaData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<title>Insert title here</title>
</head>
<body ><!-- <body scroll="no" style="overflow: hidden"> -->
<script type="text/javascript">

window.onBack = history.forward();


	var profile=[];

<%	Cookie c[]=request.getCookies();
	 String username=c[1].getValue();
	 String nowtime=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
	 String FormatedDate=LocalDateTime.now().format(DateTimeFormatter.ofPattern(" MMM dd, yyyy"));
	 //blog section arrays
	 ArrayList<String> blog_stamp= new ArrayList<>(); 
	 ArrayList<String> blog_time= new ArrayList<>(); 
	 ArrayList<String> blog_heading= new ArrayList<>(); 
	 ArrayList<String> blog_content= new ArrayList<>();
	 
	 
	 //home section arrays
	 ArrayList<String> tables= new ArrayList<>(); 
	 ArrayList<String> head_stamp= new ArrayList<>(); 
	 ArrayList<String> head_heading= new ArrayList<>(); 
	 ArrayList<String> head_content= new ArrayList<>();
	 ArrayList<String> head_username= new ArrayList<>();
	 
	 //profile array
	 ArrayList<String> profile= new ArrayList<>();
	 %>
 <%
        Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection con=DriverManager.getConnection( 
		"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password"); 
		Statement stmt=con.createStatement();
		String res=String.format("select * from userdata where username='%s'",username);
		ResultSet rs=stmt.executeQuery(res);
		int columncount=rs.getMetaData().getColumnCount();
		while(rs.next()){
			int i=1;
			while(i<=columncount) {
				profile.add(rs.getString(i++));
			}
		}
		//inserting user details into profile array
		for(String x:profile){
			out.println(String.format("profile.push('%s');",x));
		}
		con.close();
		%>
		
        
</script>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500&display=swap');

        body {
        	overflow-X:hidden;   
        }
        .page,.frame0,.frame00{
        	/*background:linear-gradient(135deg, rgba(2,0,36,1) 0%, rgba(223,150,19,1) 0%, rgba(80,53,30,1) 0%, rgba(186,223,71,1) 0%, rgba(0,212,255,1) 100%);*/
        	background-image: url("back.jpg");
        	background-size:cover;
        	background-attachment: fixed;
        	
        }
		a{
			cursor:pointer;
		}
        #heading ,#content{
        	border-radius:10px;
            resize: none;
            padding:8px;
        }
        #heading::placeholder,#content::placeholder{
        	padding:10px;
        	text-align:center;
        }
		
        .heading {
            display: flex;
            font-family: 'Poppins', sans-serif;
            font-weight: 550;
            font-size: 45px;
            margin-left: 10px;
            margin-top:10px;
			padding:10px;
			color:black;
	        mix-blend-mode: screen;
	        background:#f9fbf0;
        }

        .new-blog {
            margin-right: 210px;
            cursor: pointer;
            display: inline-block;
            transition: transform 0.5s;
        }
        .new-blog:hover{
            fill: black;
            transform: scale(1.2);
        }
        .download,.edit{
        	transition: transform 0.5s;
        }
        .download:hover,.edit:hover{
        	transform: scale(1.1);
        	fill:black;
        }
        #profile-exit{
        	transition: transform 0.5s;
        }
        #profile-exit:hover{
        	transform: scale(1.2);
        	fill:black;
        }
        .trash{
        	fill:red;
        }
        .profile{
        	transition: transform 0.5s;
        	margin-right:30px;
        }
        .profile:hover{
        	transform: scale(1.3);
        }
        .home-section {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .blog-section {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .user-time {
            display: flex;
            justify-content: space-between;
            border-bottom: 3px dashed rgb(0, 0, 0);
            font-weight: 550;
            font-size: 20px;

        }

        .usrname {
            margin-left: 10px;
        }

        .usrtime {
            margin-right: 10px;
        }

        .main {
            max-width: 1500px;
            width: 100%;
            padding: 5px 10px;
            box-shadow: 5px 8px 50% black;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            border-radius: 20px;
        }

        .frame {
            margin-top: 10px;
        }
		.sign-out{
			scale: 1.3;
		}

        #home,
        #blog {
            display: none;

        }
        
        input[type=radio]:checked + label{
        		color:black;
        }
		
        label {
            font-family: 'Poppins', sans-serif;
            font-weight: 550;
            color: rgb(20, 20, 20,0.5);
            width: 20%;
            text-align: center;
            cursor: pointer;
            position: relative;
            font-size: 33px;
            border-radius: 2px;
            
            margin-top: 10px;
            display: inline-block;
            transition: transform 0.5s;
        }
        label:hover{
            transform: translateY(-5px);
            color: var(--label-hover,black);
        }
        .frame2 {
            max-width: 1500px;
            width: 100%;
            height:100vh;
        }

        .frame2 .note {
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            display: flex;
            width: 70%;
            flex-direction: column;
            margin-top: 30px;
            border: 2px solid black;
            background: #a8cae2;
        }

        .frame2 .note:hover {

            box-shadow: 5px 5px black;

        }
        .frame2 .note0 {
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            display: flex;
            width: 70%;
            flex-direction: column;
            margin-top: 30px;
            border: 2px solid black;
            background: #a8cae2;
        }

        .frame2 .note0:hover {

            box-shadow: 5px 5px black;

        }
        .usrcontent {
        	overflow:hidden;
            display: -webkit-box;
            -webkit-line-clamp: 10;
            -webkit-box-orient: vertical;
            outline: 0;
        	background:white;
        	font-size:20px;
        	color:black;
        	resize:vertical;
            border-top: 2px solid black;
        }

        .usrhead {
        	width:100%;
        	text-align:center;
            font-size: 30px;
        }

        .frame0 {
            height: 79.5vh;
            width: 100vw;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            top: 16%;
            display: none;
            position: absolute;
        }

        .frame0 input[type=submit] {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 550;
            border-radius: 10px;
            margin-right: 5px;
            background: #000000;
            color: rgb(255, 255, 255);
            cursor: pointer;
            display: inline-block;
            transition: transform 0.5s;
        }

        .frame0 input[type=submit]:hover {
            background: #aade4f;
            color: #000000;
            transform: scale(1.1);
        }

        .frame0 input[type=button] {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 550;
            border-radius: 5px;
            background: #111111be;
            color: rgb(255, 255, 255);
            margin-left: 5px;
            cursor: pointer;
            border:none;
            display: inline-block;
            transition: transform 0.5s;
        }

        .frame0 input[type=button]:hover {
            background: #aade4f;
            color: #000000;
            transform: scale(1.1);
        }

        .frame0 .blog-head {
            display: inline-block;
            transition: transform 0.5s;
            border-radius: 10px;
        }
        .frame0 .blog-head:hover{
            background: #aade4f;
            transform: scale(1.1);
            
        }
        .frame0 .blog-head::placeholder {
            font-weight: 550;
            font-family: 'Poppins', sans-serif;
            color: #000000;
        }

        .frame0 .cont-head {
            display: inline-block;
            transition: transform 0.5s;
            border-radius: 10px;
        }
        .frame0 .cont-head:hover{
            background: #a9dfd7;
            transform: scale(1.025);
            
        }

        .frame0 .cont-head::placeholder {
            font-weight: 550;
            font-family: 'Poppins', sans-serif;
            color: #000000;
        }
        .a{
        	
        	display:inline-block;
        	border:2px solid black;
        	text-decoration:none;
        	padding:10px;
        	background: #111111be;
        	color:white;
        	border:none;
        	cursor:pointer;
        	font-family: 'Poppins', sans-serif;
        	font-weight: 550;
        	border-radius:5px;
        	transition: transform 0.5s;
        }
        .a:hover{
        	background: #aade4f;
            transform: scale(1.1);
        }
        #heading,#content{
        	border:2px solid black;
        }
        .pname,.psex,.pdob,.pnum,.pmail,.padrs,.pblogs{
        	font-weight:550;
        	font-size:20px;
        }
         .cont{
        	background: #111111be;
        	padding: 30px 30px;
        	border-radius: 10px;
        	color: white;
        	
        }
        
    </style>
    <div class="page" style="height:fit-content; margin:-8px;">
    	<!--  website name , add blog button, profile icon  -->
        <div class="main">
        	<div class="heading">MICROBLOG</div>
            <div class="new-blog"><a  id="new" style="cursor:pointer"><svg height="60" viewBox="0 0 24 24" width="60" ><path d="m12 0a12 12 0 1 0 12 12 12.013 12.013 0 0 0 -12-12zm0 22a10 10 0 1 1 10-10 10.011 10.011 0 0 1 -10 10zm5-10a1 1 0 0 1 -1 1h-3v3a1 1 0 0 1 -2 0v-3h-3a1 1 0 0 1 0-2h3v-3a1 1 0 0 1 2 0v3h3a1 1 0 0 1 1 1z"/></svg></a></div>
            <div class="profile"><a id="profile" style="cursor:pointer"><img id="profile-pic" height="60px" width="60px" style="border-radius:100px;"></img></a></div>
        </div>
        
        <!-- home,myblogs  -->
        <div class="frame" style="">
            <div class="frame1" style="display: flex; justify-content:space-evenly; ">
                <input type="radio" name="home-blog"  class="home" id="home" checked="checked">
                <label id="label-home"  for="home">Home</label>
            
                <input type="radio" name="home-blog" class="blog" id="blog">
                <label id="label-blog" for="blog">My Blogs</label>
            </div>
            
            
            <div class="frame2">
            
                <div class="home-section" >
                    
                    <!-- blog will be added here! -->
                    
                </div>
                
                <div class="blog-section" style="display: none; height:fit-content; ">
                    <!-- blog will be added here! -->
                    
                </div>
                
                
                <form name="del" action="delete.jsp" method="get ">
                <!--  time stamp   -->
                	<input type="text" style="display:none" id="del" name="del">
                </form>
                
                
                <form name="draft" action="draft.jsp" method="post">
                <!-- dhead=draft heading , dcon=draft content -->
                	<input type="text" style="display:none" id="dhead" name="dhead">
                	<input type="text" style="display:none" id="dcon" name="dcon">
                </form>
                
                
                <form name="edit" action="edit.jsp" method="post">
                <!-- date, heading, content -->
                	<input type="text" id="editdate" name="editdate" style="display:none;" >
                	<input type="text" id="edithead" name="edithead" style="display:none;" >
                	<input type="text" id="editcon" name="editcon" style="display:none;" >
                </form>
                
                
            </div>
         </div>
    </div>
    <!-- new blog section -->
    <div class="frame0" style="height:100vh;top:0%;width:100vw; left:0%; ">
    <form name="post" action="addsql.jsp" method="post">
    <input type="text" id="enhead" name="enhead" style="display:none;"><input type="text" id="encon" name="encon" style="display:none;">
        <!-- heading --><textarea placeholder="Blog Name" name="heading" id="heading" style=" height:40px; width:300px;  margin-top:-10px; margin-left:330px; margin-bottom:10px;" name="" id=""></textarea><br>
        <!-- content --><textarea style="height: 450px; width:950px;" name="content" id="content" placeholder="Enter Blog Here" ></textarea>
        <div class="pc" style="display: flex; width:100%;  margin-top:10px; justify-content:space-evenly;">
         <!-- post,save,draft,edit -->   <input type="button" value="POST" name="" id="post"><input type="button" value="Save" name="" id="edit" style="display:none;" ><input type="button" value="DRAFT" name="draft" id="draft"> <input type="button" value="CANCEL" name="" id="cancel">
        </div>
    </form>  
    </div>
    
    <!-- profile section -->
    <div class="frame00" style="height:100vh; width:100vw; left:0%;  justify-content:space-between; flex-direction:column; align-items:center; top:0%; display:none; position: absolute;">
     <!-- exit -->   <div style="display:flex;width:97vw; justify-content:end;"><a  id="profile-exit"><svg  style="margin-top:20px;margin-right:20px;" height="40px" width="40px" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="512" height="512"><g><path d="M170.698,448H72.757c-4.814-0.012-8.714-3.911-8.725-8.725V72.725c0.012-4.814,3.911-8.714,8.725-8.725h97.941   c17.673,0,32-14.327,32-32s-14.327-32-32-32H72.757C32.611,0.047,0.079,32.58,0.032,72.725v366.549   C0.079,479.42,32.611,511.953,72.757,512h97.941c17.673,0,32-14.327,32-32S188.371,448,170.698,448z"/><path d="M483.914,188.117l-82.816-82.752c-12.501-12.495-32.764-12.49-45.259,0.011s-12.49,32.764,0.011,45.259l72.789,72.768   L138.698,224c-17.673,0-32,14.327-32,32s14.327,32,32,32l0,0l291.115-0.533l-73.963,73.963   c-12.042,12.936-11.317,33.184,1.618,45.226c12.295,11.445,31.346,11.436,43.63-0.021l82.752-82.752   c37.491-37.49,37.491-98.274,0.001-135.764c0,0-0.001-0.001-0.001-0.001L483.914,188.117z"/></g></svg></a></div>
    	<div class="cont" style="display:flex;  align-items:center; background: #111111be; border-radius:10px;">
    		<img id="profile-photo" height="250px" width="250px" style="border-radius:100px; margin-left:30px;"></img>
     		<div id="profile-matter" style="margin-top:10px; margin-left:60px;"></div><br>
    	</div>
    <!-- sign out --> 	<div class="sign-out" style="display:flex;justify-content:center; margin-bottom:50px;"><a class="a" href="http://localhost:8080/Wpcc/index.html">sign-out</a></div>
    </div>
	

    <script>
    document.querySelector(".sign-out").addEventListener("click",()=>{
    	<%
    	c[1].setMaxAge(0);
    	%>
    })
    
    document.getElementById("profile-pic").setAttribute('src', profile[7]);
    	var blog_stamp=[];
    	var blog_heading=[];
    	var blog_content=[];
    	var blog_time=[];
    	var head_stamp=[];
    	var head_heading=[];
    	var head_content=[];
    	var head_username=[];
        const home=document.querySelector("#home");
        const blog=document.querySelector("#blog");
        const home_section=document.querySelector(".home-section");
        const blog_section=document.querySelector(".blog-section");
        var label_home=document.querySelector("#label-home");
        var label_blog=document.querySelector("#label-blog");
        //home,blogs section shift
        home.addEventListener("click",()=>{
            home_section.style.display="flex";
            blog_section.style.display="none";

        })
        blog.addEventListener("click",()=>{
            home_section.style.display="none";
            blog_section.style.display="flex";
        })
        
        
        //new blog
        document.querySelector("#new").addEventListener("click",()=>{
            document.querySelector(".frame0").style.display="flex";
            document.querySelector("body").style.overflowY="hidden";
        })
        //new-blog (cancel button)
        document.querySelector("#cancel").addEventListener("click",()=>{
            document.querySelector(".frame0").style.display="none";
            document.getElementById("heading").value="";
        	document.getElementById("content").value="";
        	document.getElementById("enhead").value="";
        	document.getElementById("encon").value="";
        	document.querySelector("body").style.overflowY="scroll";
        })
        
        //draft
        document.querySelector("#draft").addEventListener("click",()=>{
        	if(confirm("Confirm Draft")){
        		var encontent=window.btoa((unescape(encodeURIComponent(document.getElementById("content").value))));
	        	document.getElementById("encon").value=encontent;
	        	var enhead=window.btoa((unescape(encodeURIComponent(document.getElementById("heading").value))));
	        	document.getElementById("enhead").value=enhead;
        		var dhead=document.getElementById("enhead").value;
            	var dcon=document.getElementById("encon").value;
            	document.getElementById("dhead").value=dhead;
            	document.getElementById("dcon").value=dcon;
            	document.draft.submit();	
        	}
        })
        
        //post
        document.querySelector("#post").addEventListener("click",()=>{
        	var checkhead=document.getElementById("heading").value;
        	var checkcon=document.getElementById("content").value;
        	if(checkhead!="" && !checkhead.match(/^\s*$/)){
        		if (checkcon!="" && !checkcon.match(/^\s*$/)){
        			if(confirm("Confirm Post")){
        				var encontent=window.btoa((unescape(encodeURIComponent(document.getElementById("content").value))));
        	        	document.getElementById("encon").value=encontent;
        	        	var enhead=window.btoa((unescape(encodeURIComponent(document.getElementById("heading").value))));
        	        	document.getElementById("enhead").value=enhead;
                		document.post.submit();
                	}		
        		}
        		else{
        			alert("Blog Cannot be Empty");
        		}
        	}
        	else{
        		alert("Enter Blog name");
        	}
        })
        
        
        //profile
        
        var pmatter=document.querySelector("#profile-matter");
            var pname=document.createElement("span");
            pname.classList.add("pname");
            pname.innerHTML="Name: " +profile[0]+"<br><br>";
            var psex=document.createElement("span");
            psex.classList.add("psex");
            psex.innerHTML="Gender: "+profile[2]+"<br><br>";
            var pdob=document.createElement("span");
            pdob.classList.add("pdob");
            pdob.innerHTML="Date of Birth: "+profile[3]+"<br><br>";
            var pnum=document.createElement("span");
            pnum.classList.add("pnum");
            pnum.innerHTML="Phone no: "+profile[4]+"<br><br>";
            var pmail=document.createElement("span");
            pmail.classList.add("pmail");
            pmail.innerHTML="Mail ID: "+profile[5]+"<br><br>";
            var padrs=document.createElement("span");
            padrs.classList.add("padrs");
            padrs.innerHTML="Address: "+profile[6]+"<br><br>";
            pmatter.append(pname);
            pmatter.append(pdob);
            pmatter.append(psex);
            pmatter.append(pnum);
            pmatter.append(pmail);
            pmatter.append(padrs);
            document.getElementById("profile-photo").setAttribute('src', profile[7]);
            
        document.querySelector("#profile").addEventListener("click",()=>{
        	document.querySelector(".frame00").style.display="flex";
        	document.querySelector("body").style.overflowY="hidden";
        })
        
        //profile exit
        document.querySelector("#profile-exit").addEventListener("click",()=>{
            document.querySelector(".frame00").style.display="none";
            document.querySelector("body").style.overflowY="scroll";
        })
        
        
        
        
        
        
        
        
        	//blog-section
        
			<%
			
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			con=DriverManager.getConnection( 
			"jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password"); 
			stmt=con.createStatement();
			res=String.format("select * from blogs where name='%s' ",username);
			rs=stmt.executeQuery(res);
			int count=0;
			while(rs.next()){
				count=count+1;
				blog_stamp.add(rs.getString("stamp"));
				blog_heading.add(rs.getString("heading"));
				blog_content.add(rs.getString("content"));
				blog_time.add(rs.getString("id"));
			}
			for(String x:blog_stamp){
				out.println(String.format("blog_stamp.push('%s');",x));
			}
			for(String x:blog_heading){
				out.println(String.format("blog_heading.push('%s');",x));
			}
			for(String x:blog_content){
				out.println(String.format("blog_content.push('%s');",x));
			}
			for(String x:blog_time){
				out.println(String.format("blog_time.push('%s');",x));
			}
		    con.close();
			%>
			count="<%=count%>";
			count=Number(count);
			var pblogs=document.createElement("span");
            pblogs.classList.add("pblogs");
            pblogs.innerHTML="Total Blogs: "+count+"<br><br>";
            pmatter.append(pblogs);
			if(count>0){
				document.querySelector(".frame2").style.height="fit-content";
			}
			
			for (let i=0;i<(count);i++){
					const home_section=document.querySelector(".home-section");
		            const blog_section=document.querySelector(".blog-section");
		            const note_div=document.createElement("div");
		            note_div.classList.add("note0");
		            note_div.name="note0";
		            const user_time=document.createElement("div");
		            user_time.classList.add("user-time");
		            const usrname=document.createElement("span");
		            const usrtime=document.createElement("span");
		            const usrheading=document.createElement("span");
		            const usrcontent=document.createElement("textarea");
		           // <a class="edit"><svg  viewBox="0 0 24 24" width="30px" height="30px"><path d="M1.172,19.119A4,4,0,0,0,0,21.947V24H2.053a4,4,0,0,0,2.828-1.172L18.224,9.485,14.515,5.776Z"/><path d="M23.145.855a2.622,2.622,0,0,0-3.71,0L15.929,4.362l3.709,3.709,3.507-3.506A2.622,2.622,0,0,0,23.145.855Z"/></svg></a>

		            note_div.innerHTML='<div style="display: flex; justify-content :space-around; align-items:center; height:40px;"><a class="edit"><svg  viewBox="0 0 24 24" width="30px" height="30px"><path d="M1.172,19.119A4,4,0,0,0,0,21.947V24H2.053a4,4,0,0,0,2.828-1.172L18.224,9.485,14.515,5.776Z"/><path d="M23.145.855a2.622,2.622,0,0,0-3.71,0L15.929,4.362l3.709,3.709,3.507-3.506A2.622,2.622,0,0,0,23.145.855Z"/></svg></a><a class="trash"><svg id="Outline" height="30px" width="30px" viewBox="0 0 24 24" width="512" height="512"><path d="M21,4H17.9A5.009,5.009,0,0,0,13,0H11A5.009,5.009,0,0,0,6.1,4H3A1,1,0,0,0,3,6H4V19a5.006,5.006,0,0,0,5,5h6a5.006,5.006,0,0,0,5-5V6h1a1,1,0,0,0,0-2ZM11,2h2a3.006,3.006,0,0,1,2.829,2H8.171A3.006,3.006,0,0,1,11,2Zm7,17a3,3,0,0,1-3,3H9a3,3,0,0,1-3-3V6H18Z"/><path d="M10,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,10,18Z"/><path d="M14,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,14,18Z"/></svg></a><a class="download"><svg  version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="30" height="30"><g><path d="M188.821,377.6c37.49,37.491,98.274,37.491,135.765,0.001c0,0,0.001-0.001,0.001-0.001l68.523-68.523   c12.712-12.278,13.064-32.536,0.786-45.248c-12.278-12.712-32.536-13.064-45.248-0.786c-0.267,0.257-0.529,0.52-0.786,0.786   l-59.371,59.349L288,32c0-17.673-14.327-32-32-32l0,0c-17.673,0-32,14.327-32,32l0.448,290.709l-58.901-58.901   c-12.712-12.278-32.97-11.926-45.248,0.786c-11.977,12.401-11.977,32.061,0,44.462L188.821,377.6z"/><path d="M480,309.333c-17.673,0-32,14.327-32,32v97.941c-0.012,4.814-3.911,8.714-8.725,8.725H72.725   c-4.814-0.012-8.714-3.911-8.725-8.725v-97.941c0-17.673-14.327-32-32-32s-32,14.327-32,32v97.941   C0.047,479.42,32.58,511.953,72.725,512h366.549c40.146-0.047,72.678-32.58,72.725-72.725v-97.941   C512,323.66,497.673,309.333,480,309.333z"/></g></svg></a></div>'
		            usrtime.classList.add("usrtime");
		            usrname.classList.add("usrname");
		            usrheading.classList.add("usrhead");
		            usrcontent.classList.add("usrcontent");
		            usrtime.innerHTML=blog_stamp[i];
		            usrname.innerHTML='<%=username%>';
		            usrheading.innerHTML=decodeURIComponent(escape(window.atob(blog_heading[i])));
		            usrcontent.innerHTML=decodeURIComponent(escape(window.atob(blog_content[i])));
		            //usrcontent.disabled="true";
		            usrcontent.setAttribute('readonly', true);
		            user_time.prepend(usrtime);
		            user_time.prepend(usrname);
		            usrcontent.rows="10";
		            usrcontent.cols="30";
		            //note_div.prepend(trash);
		            note_div.prepend(usrcontent);
		            note_div.prepend(usrheading);
		            note_div.prepend(user_time);
		            blog_section.prepend(note_div);
		            const date=()=>{
		            	var d1=new Date(blog_time[i]);
	                    month = '' + (d1.getMonth() + 1);
	                    day = '' + d1.getDate();
	                    year = d1.getFullYear();
	                    hour=d1.getHours();
	                    min=d1.getMinutes();
	                    sec=d1.getSeconds();
		                if (month.length < 2) 
		                    month = '0' + month;
		                if (day.length < 2) 
		                    day = '0' + day;
		                dat=[year, month, day].join('/');
		                dat=dat+" "+hour+":"+min+":"+sec;
		                return dat;
		            }
		            note_div.querySelector(".trash").addEventListener("click",()=>{
		            	if(confirm("Confirm Delete")){
		            		dat=date();
			            	document.getElementById("del").value=dat;
			            	document.del.submit();
		            	}
		            })
		            
		            note_div.querySelector(".edit").addEventListener("click",()=>{
		            	if(confirm("Confirm Edit")){
		            		window.scrollTo(0,0);
		            		document.getElementById("heading").value=usrheading.innerHTML;
		            		document.getElementById("content").value=usrcontent.innerHTML;
				            usrcontent.innerHTML
		            		document.getElementById("new").click();
		                	document.querySelector("#post").style.display="none";
		                	document.querySelector("#edit").style.display="block";
		                	dat1=date();
		                	document.getElementById("editdate").value=dat1;
		                	document.querySelector("#edit").addEventListener("click",()=>{
		                		if(confirm("Confirm Save")){
		                			var x=document.getElementById("heading").value;
		                			var y=document.getElementById("content").value;
		                			document.getElementById("edithead").value=window.btoa((unescape(encodeURIComponent(x))));
		                			document.getElementById("editcon").value=window.btoa((unescape(encodeURIComponent(y))));
		                			document.edit.submit();
		                		}
		                		
		                	})
		            	}
		            })
		            
		            note_div.querySelector(".download").addEventListener("click",()=>{
		            	var fdat=usrcontent.innerHTML;
		            	var fname=usrheading.innerHTML;
		            	 var tt= new Blob([fdat],{type:"text/plain"});
		                 var dd=document.createElement("a");
		                 dd.download=fname+".txt";
		                 dd.href=URL.createObjectURL(tt);
		                 dd.click();
		            })
			}
			const note_div=document.createElement("div");
			note_div.classList.add("note0");
			 note_div.name="note0";
            const user_time=document.createElement("div");
            user_time.classList.add("user-time");
            user_time.style.display="flex";
            user_time.style.justifyContent="center";
            user_time.innerHTML="<span style='font-size:30px' class='usrname'>DRAFT</span>";
            const usrheading=document.createElement("span");
            const usrcontent=document.createElement("textarea");
            note_div.innerHTML='<div style="display: flex; justify-content :space-around; align-items:center; height:40px;"><a class="download"><svg  version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="30" height="30"><g><path d="M188.821,377.6c37.49,37.491,98.274,37.491,135.765,0.001c0,0,0.001-0.001,0.001-0.001l68.523-68.523   c12.712-12.278,13.064-32.536,0.786-45.248c-12.278-12.712-32.536-13.064-45.248-0.786c-0.267,0.257-0.529,0.52-0.786,0.786   l-59.371,59.349L288,32c0-17.673-14.327-32-32-32l0,0c-17.673,0-32,14.327-32,32l0.448,290.709l-58.901-58.901   c-12.712-12.278-32.97-11.926-45.248,0.786c-11.977,12.401-11.977,32.061,0,44.462L188.821,377.6z"/><path d="M480,309.333c-17.673,0-32,14.327-32,32v97.941c-0.012,4.814-3.911,8.714-8.725,8.725H72.725   c-4.814-0.012-8.714-3.911-8.725-8.725v-97.941c0-17.673-14.327-32-32-32s-32,14.327-32,32v97.941   C0.047,479.42,32.58,511.953,72.725,512h366.549c40.146-0.047,72.678-32.58,72.725-72.725v-97.941   C512,323.66,497.673,309.333,480,309.333z"/></g></svg></a></div>';
            usrheading.classList.add("usrhead");
            usrcontent.classList.add("usrcontent");
            usrcontent.style.cursor="pointer";
            usrheading.innerHTML=decodeURIComponent(escape(window.atob(profile[8])));
            usrcontent.innerHTML=decodeURIComponent(escape(window.atob(profile[9])));
            usrcontent.setAttribute('readonly', true);
            usrcontent.rows="10";
            usrcontent.cols="30";
            note_div.prepend(usrcontent);
            note_div.prepend(usrheading);
            note_div.prepend(user_time);
            blog_section.prepend(note_div);
			note_div.querySelector(".usrcontent").addEventListener("click",()=>{
				document.getElementById("heading").value=usrheading.innerHTML;
	        	document.getElementById("content").value=usrcontent.innerHTML;
	        	window.scrollTo(0,0);
				document.querySelector("#new").click();
			})
			note_div.querySelector(".download").addEventListener("click",()=>{
		            	var fdat=usrcontent.innerHTML;
		            	var fname=usrheading.innerHTML;
		            	 var tt= new Blob([fdat],{type:"text/plain"});
		                 var dd=document.createElement("a");
		                 dd.download=fname+".txt";
		                 dd.href=URL.createObjectURL(tt);
		                 dd.click();
		   })
			
		  	const note_divv=document.createElement("div");
			note_divv.classList.add("note");
			 note_divv.name="note";
            const user_timee=document.createElement("div");
            user_timee.classList.add("user-time");
            user_timee.style.display="flex";
            user_timee.style.justifyContent="center";
            user_timee.innerHTML="<span style='font-size:30px' class='usrname'>Hello "+profile[0]+"</span>";
            const usrheadingg=document.createElement("span");
            const usrcontentt=document.createElement("textarea");
            note_divv.innerHTML='<div style="display: flex; justify-content :space-around; align-items:center; height:40px;"><a style="font-size:30px">Thank You</a></div>';
            usrheadingg.classList.add("usrhead");
            usrcontentt.classList.add("usrcontent");
            usrcontentt.style.cursor="pointer";
            usrheadingg.innerHTML="";
            usrcontentt.innerHTML="\n > Welcome to Our Micro-Blogging Website \n\n > MicroBlog is a community of active people who are passionate about expressing their     \n   thoughts in the form of micro blogs \n\n > Feel Free to express yourself \n\n > Don't forget to save your thoughts in draft before you leave";
            usrcontentt.setAttribute('readonly', true);
            usrcontentt.rows="10";
            usrcontentt.cols="20";
            note_divv.prepend(usrcontentt);
            note_divv.prepend(usrheadingg);
            note_divv.prepend(user_timee);
            blog_section.prepend(note_divv);
			
			
			
			
			//home-section
			
            <%
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            con=DriverManager.getConnection( 
            "jdbc:mysql://localhost:3306/wpcc?characterEncoding=latin1","chandan@123","password"); 
            stmt=con.createStatement(); 
            String a=String.format("select * from blogs order by id desc");
           	rs=stmt.executeQuery(a);
           	int count1=0;
			while(rs.next()){
				count1=count1+1;
				head_stamp.add(rs.getString("stamp"));
				head_heading.add(rs.getString("heading"));
				head_content.add(rs.getString("content"));
				head_username.add(rs.getString("name"));
			}
			for(String x:head_stamp){
				out.println(String.format("head_stamp.push('%s');",x));
			}
			for(String x:head_heading){
				out.println(String.format("head_heading.push('%s');",x));
			}
			for(String x:head_content){
				out.println(String.format("head_content.push('%s');",x));
			}
			for(String x:head_username){
				out.println(String.format("head_username.push('%s');",x));
			}
			con.close();
            %>
            count1="<%=count1%>";
			count1=parseInt(count1);
			if(count1>0){
				document.querySelector(".frame2").style.height="fit-content";
			}
			for (let i=0;i<(count1);i++){
				const home_section=document.querySelector(".home-section");
	            const blog_section=document.querySelector(".blog-section");
	            const note_div=document.createElement("div");
	            note_div.classList.add("note");
	            const user_time=document.createElement("div");
	            user_time.classList.add("user-time");
	            const usrname=document.createElement("span");
	            const usrtime=document.createElement("span");
	            const usrheading=document.createElement("span");
	            const usrcontent=document.createElement("textarea")
	            note_div.innerHTML='<div style="display: flex; justify-content :space-around; align-items:center; height:40px;"><a class="download"><svg  version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="30" height="30"><g><path d="M188.821,377.6c37.49,37.491,98.274,37.491,135.765,0.001c0,0,0.001-0.001,0.001-0.001l68.523-68.523   c12.712-12.278,13.064-32.536,0.786-45.248c-12.278-12.712-32.536-13.064-45.248-0.786c-0.267,0.257-0.529,0.52-0.786,0.786   l-59.371,59.349L288,32c0-17.673-14.327-32-32-32l0,0c-17.673,0-32,14.327-32,32l0.448,290.709l-58.901-58.901   c-12.712-12.278-32.97-11.926-45.248,0.786c-11.977,12.401-11.977,32.061,0,44.462L188.821,377.6z"/><path d="M480,309.333c-17.673,0-32,14.327-32,32v97.941c-0.012,4.814-3.911,8.714-8.725,8.725H72.725   c-4.814-0.012-8.714-3.911-8.725-8.725v-97.941c0-17.673-14.327-32-32-32s-32,14.327-32,32v97.941   C0.047,479.42,32.58,511.953,72.725,512h366.549c40.146-0.047,72.678-32.58,72.725-72.725v-97.941   C512,323.66,497.673,309.333,480,309.333z"/></g></svg></a></div>';
	            usrtime.classList.add("usrtime");
	            usrname.classList.add("usrname");
	            usrheading.classList.add("usrhead");
	            usrcontent.classList.add("usrcontent");
	            usrtime.innerHTML=head_stamp[i];
	            usrname.innerHTML=head_username[i];
	            usrheading.innerHTML=decodeURIComponent(escape(window.atob(head_heading[i])));
	            usrcontent.innerHTML=decodeURIComponent(escape(window.atob(head_content[i])));
	            //usrcontent.disabled="true";
	            usrcontent.setAttribute('readonly', true);
	            user_time.prepend(usrtime);
	            user_time.prepend(usrname);
	            usrcontent.rows="10";
	            usrcontent.cols="30";
	            note_div.prepend(usrcontent);
	            note_div.prepend(usrheading);
	            note_div.prepend(user_time);
	            home_section.append(note_div);
	            
	            
	            note_div.querySelector(".download").addEventListener("click",()=>{
	            	var fdat=usrcontent.innerHTML;
	            	var fname=usrheading.innerHTML;
	            	 var tt= new Blob([fdat],{type:"text/plain"});
	                 var dd=document.createElement("a");
	                 dd.download=fname+".txt";
	                 dd.href=URL.createObjectURL(tt);
	                 dd.click();
	            })
			}
    </script>
</body>
</html>