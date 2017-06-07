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
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<?php
/*

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "knjiznica";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

*/

function CheckLogin($username,$password){
include("config.php");
$korisnik=$_POST['username'];
$lozinka=$_POST['password'];
$sql="SELECT korisnicko_ime, lozinka FROM login WHERE korisnicko_ime='$korisnik' AND lozinka='$lozinka'";
$result=$con->query($sql);
$num_rows=0;
while($row=$result->fetch_array())
{
$num_rows++;
	}
	mysqli_free_result($result);
	if ($num_rows >= 1) {
		return true;
	}
	else {
		return false;
	}
}
function ReturnUserData($username,$password){
	include("config.php");
	$korisnik=$_POST['username'];
	$lozinka=$_POST['password'];
	$sql="SELECT * FROM login WHERE korisnicko_ime='$korisnik' AND lozinka='$lozinka'";
	$result=$con->query($sql);
	$rez=array();
	while($ispisrez=$result->fetch_array())
	{
		$rez=$ispisrez;
	}
return $rez;}
?>
<?php
if (isset($_POST["username"])||isset($_POST["password"])){
				$username=$_POST["username"];
				$password=$_POST["password"];
				$postoji=CheckLogin($username,$password);
				
			if ($postoji){
				$rez=array();
				$uname="";
				$razina=0;
				ReturnUserData($username,$password);
				$rez=ReturnUserData($username,$password);
				
				list($uname,$razina)=$rez;
						
				setcookie('uname', $uname, time()+1800,'/');
				setcookie('razina', $razina, time()+1800,'/');
				echo "<script>alert('Uspješno ste se prijavili.')</script>" ;
				include('indexpocetna.php');
				}
				else{echo "<script>alert('Prijava nije uspjela pokušajte ponovo.');</script>"; 
				include('indexpocetna.php');}
			
}
			?>
<META HTTP-EQUIV="refresh" CONTENT="0; URL=http://localhost:81/indexpocetna.php">
