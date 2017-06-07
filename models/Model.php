<?php

include_once($_SERVER['DOCUMENT_ROOT']."/models/Fakultet.php");
    
class Model {
	public function getFakultetList()
	{
		// here goes some hardcoded values to simulate the database
		
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

$sql = "SELECT * FROM fakultet";
//mysql_query("SET NAMES 'utf8'", $connection);
$result = $conn->query($sql);
if ($result->num_rows > 0) {
	$arej = array();
    // output data of each row
	
    while($row = $result->fetch_assoc()) {
    //    echo "naziv_tvrtke: " . $row["NAZIV_TVRTKE"]. " - Naziv tvrke: " . $row["NAZIV_TVRTKE"]." Adresa: " . $row["ADRESA"]. " Vlasnik: " . $row["VLASNIK"]. "<br>";
    array_push($arej, new Fakultet($row["id_fakulteta"], $row["naziv_fakulteta"]));

	}
} else { 
$arej = array();
    //echo "0 results";
}
$conn->close();
		return $arej;
	}
	
	public function getFakultet($naziv)
	{

		
$servername = "localhost:81";
$username = "root";
$password = "";
$dbname = "knjiznica";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT * FROM fakultet WHERE id_fakulteta = ". $naziv;
//mysql_query("SET NAMES 'utf8'", $connection);
$result = $conn->query($sql);
$test = new Fakultet("a", "b");
if ($result->num_rows > 0) {
	$arej = array();
    // output data of each row
	
    while($row = $result->fetch_assoc()) {

	    array_push($arej, new Fakultet($row["id_fakulteta"], $row["naziv_fakulteta"]));

	$test = new Fakultet($row["id_fakulteta"], $row["naziv_fakulteta"]);
	}
} else { 
$arej = array();

    //echo "0 results";
}
$conn->close();
		return $test;
	}
	
	}
	

?>