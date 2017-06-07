<?php # HelloServer.php
# Copyright (c) 2005 by Dr. Herong Yang, http://www.herongyang.com/
#
function hello($yourName) { 
  $username = "root";
$password = "";
$hostname = "localhost"; 

$dbhandle = mysql_connect($hostname, $username, $password) 
  or die("Unable to connect to MySQL");

$selected = mysql_select_db("knjiznica",$dbhandle)
  or die("Could not select knjiznica");

$result = mysql_query("SELECT knjiga.naziv_knjige, knjiga.id_knjige, izdavac.naziv_izdavaca, vrsta_knjiga.vrsta_knjige
    FROM knjiga INNER JOIN izdavac ON knjiga.id_izdavaca = izdavac.id_izdavaca 
    INNER JOIN vrsta_knjiga ON knjiga.id_vrstaknjige = vrsta_knjiga.id_vrstaknjige 
    WHERE izdavac.naziv_izdavaca LIKE '%{$yourName}%' OR vrsta_knjiga.vrsta_knjige LIKE '%{$yourName}%'");

  
  while ($row = mysql_fetch_array($result)) {
	  
    $privremeni = $privremeni
      ."\n Naziv izdavaca: " . $row["naziv_izdavaca"]
      ."\n Vrsta knjige: " . $row["vrsta_knjige"]      
    ."\n Naziv knjige: " . $row["naziv_knjige"]
        
      ."\n \n";
}
  
  
  //return $jsonn;
      return $privremeni;
} 
   $server = new SoapServer(null, 
      array('uri' => "urn://www.herong.home/res"));
   $server->addFunction("hello"); 
   $server->handle(); 
?>
