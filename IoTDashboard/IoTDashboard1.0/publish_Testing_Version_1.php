<?php
require("phpMQTT.php");
?>

<html>
<body>

	<form action="publish.php" method="POST">
	Topic: <input type="text" name=topic><br>
	Message: <input type="text" name=message><br>
	<input type="submit" value="Submit">
	</form>

</body>
</html>

<?php

if (isset($_REQUEST['topic']))
{
	$mqtt = new phpMQTT("localhost", 1883, "PHP MQTT Publisher");

	if ($mqtt->connect()) 
	{
		echo "Published TOPIC:"." ".$_REQUEST['topic']."<br>";
		echo "Published MESSAGE:"." ".$_REQUEST['message']."<br>";
		$mqtt->publish($_REQUEST['topic'], $_REQUEST['message'],0);
		$mqtt->close();
	}
}
?>
