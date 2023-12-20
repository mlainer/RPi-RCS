<!DOCTYPE html>
<html>

<head>
<meta name="viewpoint" content="width=device-width" />
<meta charset="UTF-8">
<title>Funksteckdosen schalten</title>
</head>
<body>

<form method="get" action="Funksteckdosen.php">
<input type="submit" value="Lampe0" name="Lampe0">
</form>
</br>
<form method="get" action="Funksteckdosen.php">
<input type="submit" value="Lampe1" name="Lampe1">
</form>

<?php

if(isset($_GET['Lampe0'])){
exec("sudo /home/pi/bin/.send 00010 1 0");	
}

if(isset($_GET['Lampe1'])){
exec("sudo /home/pi/bin/.send 00010 1 1");	
}

?>

</body>
</html>
