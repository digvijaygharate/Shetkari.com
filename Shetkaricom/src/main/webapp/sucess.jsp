<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap 5 Thank You Example</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
        
        #hero {
  width: 100%;
  height: 100vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
}
#rcorners1 {
  border-radius: 25px;
  background: #73AD21;
  padding: 20px;
  width: 700px;
  height: 350px;
 
}
        </style>
    </head>

    <body id="hero">
        <div class="vh-100 d-flex justify-content-center align-items-center " >
            <div style="background-color :#eee !important; padding:15px; " id="rcorners1" >
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                        fill="green" class="bi bi-check-circle-fill" style="margin-top:40px;"viewBox="0 0 16 16">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                    </svg>
                </div>
                <div class="text-center">
                    <h1>THANK YOU FOR REGISTERING ! </h1>
                    
                    <a id="btn" href="#" onclick="enableButton2()">Before proceeding please click here</a><br><br>
                    
  					
                	 <a href="user_profile.jsp"><input type="button" id="btn2" class="btn btn-success" value="Go to next"  /></a>
               
                </div>
            </div>
 </div>
 <script>
document.getElementById("btn").addEventListener("click",()=>{

    var m="thank you so much for registering......Just give me 2 minutes before proceeding.... If you face any problem while handling the website,... please go to contact and get further information..... Hope you have a good experience..... thank you...  ";
    const utterance =new SpeechSynthesisUtterance(m);
    utterance.pitch=1;
    utterance.rate=0.8;
    utterance.volume=1;
    utterance.voice=window.speechSynthesis.getVoices()[10];
    speechSynthesis.speak(utterance);
});

</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.3.js"></script> 
      <script type="text/javascript">
    $(function(){/*from w  ww . j  ava2s. c o m*/

$("#btn2").attr("disabled", true);

    });

      </script> 
    </body>

</html>