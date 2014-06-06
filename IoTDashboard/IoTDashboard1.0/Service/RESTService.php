<?php
	require("../MQTT/MQTT.php");
	
	class Message
	{
		private $vrijednost, $datum, $vrijeme;
		
		public function getValue() { echo $this->vrijednost; }
		public function getDate() { echo $this->datum; }
		public function getTime() { echo $this->vrijeme; }
		public function setValue($value) { $this->vrijednost = $value; }
		public function setDate($date) { $this->datum = $date; }
		public function setTime($time) { $this->vrijeme = $time; }
	}
	
	function DajZadnjuVrijednost($widgetType, $widgetID)
	{
		try
		{	
			if(strpos($widgetType, 'enumerated') == false)
				$q = mysql_query("SELECT value FROM last_".$widgetType."_value WHERE ".$widgetType."_widget_id = '".$widgetID."';") or die("Error in query: ".mysql_error());
			else
			{
				$type = substr($widgetType, 11);
				$q = mysql_query("SELECT value FROM last_".$type."_value WHERE enumerated_".$type."_widget_id = '".$widgetID."';") or die("Error in query: ".mysql_error());
			}
			$row = mysql_fetch_assoc($q);
			$value = $row['value']; 
			return $value;		
		}
		catch (Exception $e) 
		{
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	
	function DajArhiviraneVrijednosti($widgetType, $widgetID)
	{
		$messages = array();
		try
		{	
			if(strpos($widgetType, 'enumerated') == false)
				$q = mysql_query("SELECT value, date, time FROM archived_".$widgetType."_value WHERE ".$widgetType."_widget_id = '".$widgetID."';") or die("Error in query: ".mysql_error());			
			else
			{
				$type = substr($widgetType, 11);
				$q = mysql_query("SELECT value, date, time FROM archived_".$type."_value WHERE enumerated_".$type."_widget_id = '".$widgetID."';") or die("Error in query: ".mysql_error());
			}
			while ($row = mysql_fetch_assoc($q))
			{
				$message = new Message();
				$message->setValue($row['value']);
				$message->setDate($row['date']); 
				$message->setTime($row['time']); 
				array_push($messages, $message);
			}		
			return $messages;		
		}
		catch (Exception $e) 
		{
			echo 'Caught exception: ',  $e->getMessage(), "\n";
		}
	}
	
	function PostaviVrijednost($topic, $message)
	{
		$mqtt = new phpMQTT("localhost", 1883, "PHP MQTT Publisher");
		if ($mqtt->connect())
		{
			$mqtt->publish($topic, $message, 0);
			$mqtt->close();
		}
	}
?>
