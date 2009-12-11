<html>
<head>
	<meta http-equiv="refresh" content="60">
</head>
<body>
<h1>PGP-PermanentParty</h1>
<? 
/*
 * PGP-PermanentParty was deployed during 
 *  NinuxDay09 http://wiki.ninux.org/NinuxDay2009en
 *
 *  Copyright (C) 2009 Claudio Mignanti
 *
 */


if (isset($_POST["uid"])) {
	//check uid
	
	if ( ereg("[A-F0-9]{8}", $_POST["uid"])) {
		$ret = fopen("./chiavi", "a+");

		fwrite ($ret, $_POST["uid"] ."\n");
		fclose ($ret);

		echo "<p>uid ". $_POST["uid"] ." added!</p><br>";	
	} else {
		echo "not a valid uid key";
	}
}

?>

<form method="post">
	Insert your uid key:<input type="text" name="uid">
	<input type="submit" value="Add me!">
</form>

<? 

// open a file


if ( file_exists("ninux.org.png") ) {
	$fp = fopen("ninux.org.png", "r");
	$fstat = fstat($fp);
	// close the file
	fclose($fp);

	echo "Last <a href=\"http://en.wikipedia.org/wiki/Web_of_trust\">wot</a> 
		update ". date( "r", $fstat["mtime"] ) ."<br>";
	
	echo '<br>
<img src="./ninux.org.png">
<br>';

}
?>

<small>Deployed by Claudio Mignanti for NinuxDay09</small>
</body>
</html>




