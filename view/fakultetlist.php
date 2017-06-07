<html>
<head></head>

<body>

<table>
	<tr><td><pre>Naziv fakulteta</pre> </td><td><pre>ID fakulteta</pre> </td></tr> 
	<?php 

		foreach ($fakultets as $naziv => $fakultet)
		{
			echo '<tr><td><a href="indexpocetna.php?naziv='.$fakultet->naziv_fakulteta.'">'.$fakultet->naziv_fakulteta.'</a></td>
            <td>'.$fakultet->id_fakulteta.'</td>
            </tr>';
		}

	?>
</table>

</body>
</html>