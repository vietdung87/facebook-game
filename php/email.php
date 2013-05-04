<?php
$mailServer=""// mail to ;



$subject = $_POST["subject"];

$headers = "From: " . $_POST["name"] . "<" . $_POST["email"] .">\r\n";

$headers .= "Reply-To: " . $_POST["email"] . "\r\n";


$headers .= "Return-path: " . $_POST["email"];



$message = $_POST["message"];


mail($mailServer, $subject, $message, $headers);
if(mail){
	echo "Mail has been send"
}else{
	echo "try again"
}

?>