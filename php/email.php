<?php

$sendTo = "boy_stylish@yahoo.com";

$subject = $_POST["sSubject"];

$headers = "From: " . $_POST["sName"] . "<" . $_POST["sEmail"] .">\r\n";

$headers .= "Reply-To: " . $_POST["sEmail"] . "\r\n";


$headers .= "Return-path: " . $_POST["sEmail"];



$message = $_POST["sMessage"];


mail($sendTo, $subject, $message, $headers);

?>