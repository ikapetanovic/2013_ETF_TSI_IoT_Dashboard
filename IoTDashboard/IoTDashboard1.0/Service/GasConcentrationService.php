<?php
	require('RESTService.php');
	mysql_connect('localhost', 'root', '') or die(mysql_error());
	mysql_select_db('iot_dashboard_db') or die(mysql_error());
	$lastGasConcentrationValue = DajZadnjuVrijednost('decimal', 3);
	echo $lastGasConcentrationValue;
?>