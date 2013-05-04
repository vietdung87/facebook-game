<?php
require_once 'database.php';

$sql= "SELECT * FROM   questionData";
$query=Database::dbQuery($sql);

$result = array();


while($row=mysql_fetch_assoc($query)){
	$option= array($row[option1],$row['option2'],$row['option3'],$row['option4']);
	$result[]=array('question' => $row['question'], 'rightAnswer' => $row['rightAnswer'], 'option' =>$option);
}
echo json_encode($result);
