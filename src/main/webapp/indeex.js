//password visible button
const vis=document.querySelector("#vis");
const unvis=document.querySelector("#unvis");
const vis0=document.querySelector("#vis0");
const unvis0=document.querySelector("#unvis0");
const passw=document.querySelector("#password");
const passw0=document.querySelector("#password0");
const vis1=document.querySelector("#vis1");
const unvis1=document.querySelector("#unvis1");
const passw1=document.querySelector("#password1");
        vis.addEventListener("click",function(){
            unvis.style.display="block";
            vis.style.display="none";
            passw.setAttribute("type","text");
        }); 
        unvis.addEventListener("click",function(){
            unvis.style.display="none";
            vis.style.display="block";
            passw.setAttribute("type","password");
        });
        vis0.addEventListener("click",function(){
            unvis0.style.display="block";
            vis0.style.display="none";
            passw0.setAttribute("type","text");
        }); 
        unvis0.addEventListener("click",function(){
            unvis0.style.display="none";
            vis0.style.display="block";
            passw0.setAttribute("type","password");
        });
        vis1.addEventListener("click",function(){
            unvis1.style.display="block";
            vis1.style.display="none";
            passw1.setAttribute("type","text");
        }); 
        unvis1.addEventListener("click",function(){
            unvis1.style.display="none";
            vis1.style.display="block";
            passw1.setAttribute("type","password");
        });
        
        
        //requirments under name and password
        document.querySelector("#name").addEventListener("focus",()=>{
			document.getElementById("userreq").style.display="block";
		})
		document.querySelector("#name").addEventListener("focusout",()=>{
			document.getElementById("userreq").style.display="none";
		})
        document.querySelector("#password").addEventListener("focus",()=>{
			document.getElementById("passreq").style.display="block";
		})
		document.querySelector("#password").addEventListener("focusout",()=>{
			document.getElementById("passreq").style.display="none";
		})
		
		
		//signin  sign up (shfit)
const up=document.querySelector("#up");
var label_in=document.getElementById("label-in");
var label_up=document.getElementById("label-up");
        up.addEventListener("click",()=>{
            document.getElementById("inn").style.display="none";
            document.getElementById("upp").style.display="block";
            label_in.style.border="none";
            label_up.style.borderBottom="4px solid #dc8c5d";
            label_in.style.color="rgba(255, 255, 255, 0.2)";
            label_up.style.color="white";
            document.getElementById("main").style.height="110vh";
            document.querySelector("html").style.height="115vh";
        })
        const in1=document.querySelector("#in");
        in1.addEventListener("click",()=>{
            document.getElementById("inn").style.display="block";
            document.getElementById("upp").style.display="none";
            label_in.style.borderBottom="4px solid #dc8c5d";
            label_up.style.border="none";
            label_in.style.color="white";
            label_up.style.color="rgba(255, 255, 255, 0.2)";
            document.getElementById("main").style.height="98vh";     
            document.querySelector("html").style.height="100vh";
        })

        //loads img into register page
        const img=document.querySelector("#userimg");
        const imgput=document.querySelector("#photo");
        imgput.addEventListener("change",()=>{
            if (imgput.files &&  imgput.files[0]){
                hi=URL.createObjectURL(imgput.files[0]);
                //inserting img string to source
                img.src=hi;
                img.onload=()=>{
                    URL.revokeObjectURL(img.src)
                }
            }
        });
        
        //captcha
        function captcha(){
            var uniqchar = "";
            const allchar ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
            for (let i = 0; i < 6; i++) {
                uniqchar +=  allchar[Math.floor(Math.random()*62)]  
            }
            document.getElementById("cap").value=uniqchar;
        }
        captcha();
        
        //validation
        function check(){
            var name=myform.name.value;
            if ( name.length>=6){
                if (name.match(/^[a-zA-Z]/g) && name.match(/\w/g) && !name.match(/\W/g)){
                    var password=myform.password.value;
                    if (password.length>=8){
                        if (password.match(/[a-z]/g) && password.match(/[A-Z]/g) && password.match(/[0-9]/g) && password.match(/\W/g)){
                            var re_pass=myform.password0.value;
                            if (re_pass!=""){
                                if (password==re_pass){
                                    var gender=myform.gender.value;
                                    if (gender!=""){
                                        var mm=myform.mm.value;
                                        var dd=myform.dd.value;
                                        var yyyy=myform.yyyy.value;
                                        if (mm!="month"&&dd!="day"&&yyyy!="year"){
                                            var phone=myform.phone.value;
                                            if (phone!=""){
                                                if (phone.match(/^[6-9]{1}[0-9]{9}$/)){
                                                    var mail=myform.mail.value;
                                                    if (mail!=""){
                                                        if (mail.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)){
                                                            var adrs1=myform.adrs1.value;
                                                            var adrs2=myform.adrs2.value;
                                                            var adrs3=myform.adrs3.value;
                                                            if (adrs1!="" && adrs2!="" && adrs3!="" ){
																	var photo=myform.photo.value;
	                                                                if (photo!=""){
	                                                                    var cap=document.getElementById("cap").value;
	                                                                    var cap1=myform.cap1.value;
	                                                                    if (cap1!=""){
	                                                                        if (cap==cap1){
                                                                                return
	                                                                        }
	                                                                        else{
	                                                                            alert("Captcha doesn't match");
	                                                                            captcha();
	                                                                            
	                                                                            event.preventDefault();
	                                                                        }
	                                                                    }
	                                                                    else{
	                                                                        alert("Enter Captcha");
	                                                                        event.preventDefault();
	                                                                    }
																     }
																     else{
                                                                          alert("Select photo");
                                                                          event.preventDefault();
                                                                     }  
                                                            }
                                                            else{
                                                                alert("FILL ALL ADDRESS FIELDS");
                                                                event.preventDefault();
                                                            }
                                                        }
                                                        else{
                                                            alert("Invalid mail");
                                                            event.preventDefault();
                                                        }
                                                    }
                                                    else{
                                                        alert("Enter Mail ID");
                                                        event.preventDefault();
                                                    }
                                                }
                                                else{
                                                    alert("Enter valid Phone number");
                                                    event.preventDefault();
                                                }
                                            }
                                            else{
                                                alert("Enter phone number");
                                                event.preventDefault();
                                            }
                                        }
                                        else{
                                            alert("Select DOB");
                                            event.preventDefault();
                                        }
                                    }
                                    else{
                                        alert("select gender");
                                        event.preventDefault();
                                    }
                                }
                                else{
                                    alert("Password and Re-type password must be same");
                                    event.preventDefault();
                                }
                            }
                            else{
                                alert("Re-type password");
                                event.preventDefault();
                            }
                        }
                        else{
                            alert("password should contain uppercase,lowercase,numeric and special character values");
                            event.preventDefault();
                        }
                        event.preventDefault();
                    }
                    else if (password==""){
                        alert("Enter password");
                        event.preventDefault();
                    }
                    else{
                        alert("password must have atleast 8 characters");
                        event.preventDefault();
                    }
                }
                else if (name.match(/\s/g)){
                    alert("Username cannot have spaces");
                    event.preventDefault();
                }
                else if (name.match(/^[0-9]/g)){
                    alert("Username cannot have numeric values as first letter ");
                    event.preventDefault();
                }
                else if (name.match(/\W/g)){
                    alert("Username Cannot have special character except  underscore");
                    event.preventDefault();
                }
                else{
                    alert("Invalid Username");
                    event.preventDefault();
                }
            }
            else if(name==""){
                alert("Enter username");
                event.preventDefault();
            }
            else{
                alert("Username must have atleast 6 characters");
                event.preventDefault();
            }
            
        }
        
        
        //sign-in 
        function checkk(){
			var username=loginform.username.value;
			var passwordd=loginform.password.value;
			if (username!=""){
				if (passwordd!=""){
					retun
				}
				else{
					alert("Enter password");
					event.preventDefault();
				}
			}
			else{
				alert("Enter username");
				event.preventDefault();
			}
		}
		
		//converting photo to base64 string to store in sql database
        function imgbase(a){
			var file = a.files[0];
     
        	var reader = new FileReader();
         
      	    reader.onloadend = function () {
				  document.getElementById("photodata").value=reader.result;
        }
        	reader.readAsDataURL(file);
		}