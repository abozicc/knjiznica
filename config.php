<?php

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'knjiznica';

if (!$con=@mysql_connect($dbhost, $dbuser, $dbpass)){
				die ("<b>Spajanje na mysql server je bilo neuspjesno</b>");}
mysql_select_db($dbname);
mysql_query("SET NAMES utf8");
mysql_query("SET CHARACTER SET utf8");
mysql_query("SET COLLATION_CONNECTION='utf8_unicode_ci'");

?>
