<!DOCTYPE html>
<html>
    <head></head>
    <body>
    
<?php
$user = 'root';
$pass = '';
$db = 'knjiznicaa';

$db = new mysqli('localhost', $user, $pass, $db) or die("Unable to connect");

$query = "SELECT * FROM knjiga";
mysqli_query($db, $query) or die('Error querying database.');

$result = mysqli_query($db, $query);

// $row = mysqli_fetch_array($result); nije izbacivalo prvi

while ($row = mysqli_fetch_array($result)) {
	
	$a[]=($row['naziv_knjige']);
    
$q = $_REQUEST["q"];

$hint = "";

// lookup all hints from array if $q is different from "" 
if ($q !== "") {
    $q = strtolower($q);
    $len=strlen($q);
    foreach($a as $name) {
        if (stristr($q, substr($name, 0, $len))) {
            if ($hint === "") {
                $hint = $name;
            } else {
                $hint .= ", $name";
            }
        }
    }
}
}
// Output "no suggestion" if no hint was found or output correct values 
echo $hint === "" ? "no suggestion" : $hint;


echo "<table border=1>
<tr>
<th>Naziv knjige</th>
<th>Autor knjige</th>
<th>Šifra knjige</th>
</tr>";
        
$result = mysqli_query($db,
    "SELECT knjiga.naziv_knjige, knjiga.id_knjige, autor.naziv_autora FROM knjiga INNER JOIN autor ON knjiga.id_autora = autor.id_autora");
      
while($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>" . $row['naziv_knjige'] . "</td>";
    echo "<td>" . $row['naziv_autora'] . "</td>";
    echo "<td>" . $row['id_knjige'] . "</td>";
    echo "</tr>";
}
echo "</table>";
        
        
mysqli_close($db);



?>
    </body>
</html>