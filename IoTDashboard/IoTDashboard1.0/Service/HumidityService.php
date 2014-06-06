<?php
	require('RESTService.php');
	mysql_connect('localhost', 'root', '') or die(mysql_error());
	mysql_select_db('iot_dashboard_db') or die(mysql_error());
	$lastHumidityValue = DajZadnjuVrijednost('decimal', 2);
	echo $lastHumidityValue;
?>