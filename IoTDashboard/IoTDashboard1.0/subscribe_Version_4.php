<?php
require("phpMQTT.php"); // NAPOMENA: podesiti odgovarajuću putanju

function procmsg($topic, $msg)
{
	// Kada se primi poruka na nekom topicu poruka se spašava u bazu
	
	//$topic = mysql_real_escape_string(htmlentities($topic, ENT_QUOTES)); // SQL Injection
	//$msg = mysql_real_escape_string(htmlentities($msg, ENT_QUOTES)); // SQL Injection		
	
	try
	{
		mysql_connect("localhost", "root", "root") or die("Unable to connect to the server: ".mysql_error()); // NAPOMENA: podesiti odgovarajući username i password
		mysql_set_charset("utf8");
		mysql_select_db("iot_dashboard_db") or die("Unable to connect to the database: ".mysql_error()); // NAPOMENA: Ukoliko se promijeni, podesiti odgovarajući naziv baze
				
		$q1 = mysql_query("SELECT id, type FROM widget WHERE topic = '".$topic."';") or die("Error in query: ".mysql_error());			
		
		$row = mysql_fetch_assoc($q1);
		$topicID = $row['id'];
		$type = $row['type'];
		
		if (isset($topicID))
		{				
			$table = "";
			switch ($type)
			{
				case "bool":
					$table = "bool_widget";
					$msg = intval($msg); // Jer je stavljeno da se u bazi vrijednost čuva kao tinyint(1)
					break;
				case "decimal":
					$table = "decimal_widget";
					$msg = floatval($msg);
					break;
				case "enumerated_decimal":
					$table = "enumerated_decimal_widget";
					$msg = floatval($msg);
					break;	
				case "integer":
					$table = "integer_widget";
					$msg = intval($msg);
					break;
				case "enumerated_integer":
					$table = "enumerated_integer_widget";
					$msg = intval($msg);
					break;			
				case "textual":
					$table = "textual_widget";
					break;
				case "enumerated_textual":
					$table = "enumerated_textual_widget";
					break;
			}					
			
			$q2 = mysql_query("SELECT id, archiving_on FROM ".$table." WHERE widget_id = ".$topicID.";") or die("Error in query: ".mysql_error());			
			$row = mysql_fetch_assoc($q2);
			$typeWidgetID = $row['id'];
			$archivingON = $row['archiving_on'];
			
			// Spašavanje poruke u tabelu u kojoj se čuva zadnja primljena vrijednost
			$q3 = mysql_query("INSERT INTO last_".$type."_value SET value = '".$msg."', ".$type."_widget_id = '".$typeWidgetID."';") or die("Error in query: ".mysql_error());
			
			// Ako je uključeno arhiviranje topica, poruka se spašava i u tabelu za arhiviranje
			if ($archivingON) 
				$q4 = mysql_query("INSERT INTO archived_".$type."_value SET value = '".$msg."', ".$type."_widget_id = '".$typeWidgetID."', date = '".date("Y-m-d")."', time = '".date("H:i:s")."';") or die("Error in query: ".mysql_error());			
										
			mysql_close();			
		}			
	}
	catch (Exception $e) 
	{
		echo 'Caught exception: ',  $e->getMessage(), "\n";
	}
}
	
while(1)
{
	$mqtt = new phpMQTT("localhost", 1883, "PHP MQTT Subscriber"); // NAPOMENA: Ukoliko bude potrebno, podesiti odgovarajuće address i clientid 

	if(!$mqtt->connect(true))
		exit(1);

	// Za sve topice definisane u bazi podataka radi se SUBSCRIBE prema MQTT brokeru
	
	$topicsFromDB = array();
	
	try
	{
		mysql_connect("localhost", "root", "root") or die("Unable to connect to the server: ".mysql_error()); // NAPOMENA: podesiti odgovarajući username i password
		mysql_set_charset("utf8");
		mysql_select_db("iot_dashboard_db") or die("Unable to connect to the database: ".mysql_error()); // NAPOMENA: Ukoliko se promijeni, podesiti odgovarajući naziv baze 
		
		$q = mysql_query("SELECT topic FROM widget;") or die("Error in query: ".mysql_error());
		
		while ($row = mysql_fetch_assoc($q))
			array_push($topicsFromDB, $row['topic']);
			
		mysql_close();
	}
	catch (Exception $e) 
	{
		echo 'Caught exception: ', $e->getMessage(), "\n";
	}

	foreach($topicsFromDB as $topic)
		$topics[$topic] = array("qos"=>0, "function"=>"procmsg");

	$mqtt->subscribe($topics, 0);

	while($mqtt->proc())
	{
		/* S obzirom da u PHP biblioteci ne postoji UNSUBCRIBE, na svaku promjenu u listi topic-a, radi se sljedeće:
			- diskonektovanje sa broker-a,
			- ponovo se konektovanje na broker (sa parametrom clean=true),
			- SUBSCRIBE za novu listu topic-a. */
		
		try
		{
			mysql_connect("localhost", "root", "root") or die("Unable to connect to the server: ".mysql_error()); // NAPOMENA: podesiti odgovarajući username i password
			mysql_set_charset("utf8");
			mysql_select_db("iot_dashboard_db") or die("Unable to connect to the database: ".mysql_error()); // NAPOMENA: Ukoliko se promijeni, podesiti odgovarajući naziv baze 
			
			$q = mysql_query("SELECT flag FROM widget_change WHERE flag = 1;") or die("Error in query: ".mysql_error());
			$row = mysql_fetch_assoc($q);
			$flag = $row['flag'];
			
			mysql_close();
			
			if($flag == 1) // 1 označava da ima promjena u listi topica, a 0 da nema
			{	
				try
				{
					mysql_connect("localhost", "root", "root") or die("Unable to connect to the server: ".mysql_error()); // NAPOMENA: podesiti odgovarajući username i password
					mysql_set_charset("utf8");
					mysql_select_db("iot_dashboard_db") or die("Unable to connect to the database: ".mysql_error()); // NAPOMENA: Ukoliko se promijeni, podesiti odgovarajući naziv baze 
					
					$q = mysql_query("UPDATE widget_change SET flag = '0';") or die("Error in query: ".mysql_error());				
					mysql_close();
				}
				catch (Exception $e) 
				{
					echo 'Caught exception: ', $e->getMessage(), "\n";
				}
				$mqtt->disconnect();
				break;
			}			
		}
		catch (Exception $e) 
		{
			echo 'Caught exception: ', $e->getMessage(), "\n";
		}					
	}
	$mqtt->close();
}

?>
