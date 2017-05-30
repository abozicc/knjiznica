<?php
if(!extension_loaded("soap")){
  dl("php_soap.dll");
}

ini_set("soap.wsdl_cache_enabled",0); //moguce je nulu i pod navodnike
$server = new SoapServer("hello.wsdl");

function doHello($yourName){
 
$username = "root";
$password = "";
$hostname = "localhost"; 

$dbhandle = mysql_connect($hostname, $username, $password) 
  or die("Unable to connect to MySQL");

$selected = mysql_select_db("knjiznica",$dbhandle)
  or die("Could not select knjiznica");

  
$result = mysql_query("SELECT knjiga.naziv_knjige, knjiga.id_knjige, autor.naziv_autora, izdavac.naziv_izdavaca, vrsta_knjiga.vrsta_knjige 
    FROM knjiga INNER JOIN autor ON knjiga.id_autora = autor.id_autora 
    INNER JOIN izdavac ON knjiga.id_izdavaca = izdavac.id_izdavaca 
    INNER JOIN vrsta_knjiga ON knjiga.id_vrstaknjige = vrsta_knjiga.id_vrstaknjige 
    WHERE knjiga.naziv_knjige LIKE '%{$yourName}%'");
//$response = array();
  
  
  while ($row = mysql_fetch_array($result)) {
  /*
	$tmp= array();
		$tmp["Naziv knjige"] = $row["naziv_knjige"]; 
		$tmp["ID knjige"]        = $row["id_knjige"];
		$tmp["izdavac"]        = $row["SELECT naziv_izdavaca FROM izdavac WHERE izdavac.id_izdavaca = knjiga.id_izdavaca"];
		$tmp["autor"]        = $row["naziv_autora"];
		$tmp["vrsta knjige"]        = $row["vrsta_knjiga_vrsta_knjige"];

        array_push($response, $tmp);
	*/	
	
	
    $privremeni = $privremeni
      ."\n Naziv knjige: " . $row["naziv_knjige"]
      ."\n ID knjige: " . $row["id_knjige"]
      ."\n Izdavac: " . $row["naziv_izdavaca"]
      ."\n Autor: " . $row["naziv_autora"]
      ."\n Vrsta knjige: " . $row["vrsta_knjige"];	  
}


//    $jsonn = json_encode($response);
//	return $jsonn;
    return $privremeni;
}

                    
$server->AddFunction("doHello");
$server->handle();
?>
