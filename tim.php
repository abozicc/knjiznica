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
   
    
     <!--Skripta -->  

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
                 
                    <li >
                        <a href="indexpocetna.php" ><i class="fa fa-desktop "></i> Knjiznica </a>
                    </li>
                    
                    
                    <li>
                        <a href="zadatak.php"><i class="fa fa-edit "></i>Zadatak</a>
                    </li>
                    
                    <li >
                        <a href="baza.php"><i class="fa fa-table "></i>Baza</a>
                    </li>


                    <li class="active-link">
                        <a href="tim.php"><i class="fa fa-user "></i>O nama</a>
                    </li>
                      <li>
                        <a href="mvc.php"><i class="fa fa-bars "></i>MVC</a>
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
                             <strong> Tim </strong> 
                        </div>
                       
                    </div>
                    </div>
                
                
                <div>
               
                Članovi tima: <br>
                Ana Božić 340 <br>
                Valentina Viskovic 342 <br>
                    
                
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
