
<?php
if (isset($_COOKIE['uname'])){
$prijavljen=true;
$razina=$_COOKIE['razina'];
}
else {
$prijavljen=false;
$razina=0;
}
?>

<!DOCTYPE html>
<?php

require("config.php");
?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Knjiznica</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>


    
<!--
  <script>
function showHint(str) {
    if (str.length == 0) { 
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        }
        xmlhttp.open("GET", "connect.php?q="+str, true);
        xmlhttp.send();
    }
}

</script>
-->

</head>
<body>
    <!--PHP -->
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="assets/img/logo1.png" />

                    </a>
                    
                </div>
                 
                <span style = "float: right; padding-top: 20px; padding-right: 40px">
<?php
if(!isset($_COOKIE['uname']))
    {
                echo' <form method="post" action="prijava.php" >
                     <ul>
                    
                  
                    <input type="username" placeholder="Korisnicko ime" name="username">
                  
                    <input type="password" placeholder="Lozinka" name="password">
                 
                    <input type="submit" name="Prijava " value="Prijavi se" >
                
                    </form>';
                }
                else
                {
                    echo '
                    <form method="post" action="logout.php" >

                
                    <input class="btn btn-primary" type="submit" name="Prijava " value="Odjavi se" >
                    
                    </ul>
                    </form>
                    ';
                }
                    ?> 

                </span>
               
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                    <li class="active-link">
                        <a href="indexpocetna.php" ><i class="fa fa-desktop "></i> Knjiznica </a>
                    </li>
                    
                    
                    <li>
                        <a href="zadatak.php"><i class="fa fa-qrcode "></i>Zadatak</a>
                    </li>
                    
                    <li>
                        <a href="baza.php"><i class="fa fa-qrcode "></i>Baza</a>
                    </li>


                    <li>
                        <a href="tim.php"><i class="fa fa-qrcode "></i>O nama</a>
                    </li>
                
                    
                </ul>
                            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>Radna površina - Administrator </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong> Dobrodošli u knjižnicu </strong> 
                        </div>
                       
                    </div>
                    </div>
                            
<br><br>
                     
                
                    <?php # HelloClient.php
# Copyright (c) 2005 by Dr. Herong Yang
#  
	$naziv=$_POST['trazi'];
   $client = new SoapClient(null, array(
      'location' => "http://localhost:81/HelloServer.php",
      'uri'      => "urn://neretva.fsr.ba/hello",
      'trace'    => 1 ));

   $return = $client->__soapCall("hello",array("$naziv"));
   	echo("\n<pre>".$return)."</pre>";

?>

                
				<br>
  
                </div>              
                
                
                  <!-- /. ROW  --> 
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy; knjiznica | Dizajn: <a href="http://binarytheme.com" style="color:#fff;" target="_blank">Valentina Visković i Ana Božić</a>
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
