<?php
class Database{

	private static $Host="localhost";
	private static $root="root";
	private static $pass="";
	private static $db="Game";

	public static function dbQuery($sql){
		$connection = mysql_connect(self::$Host,self::$root,self::$pass) or
		die ("couldn't connect to localhost");

		mysql_select_db(self::$db,$connection);
		mysql_query("set names 'utf8'");
		$result = mysql_query($sql,$connection);

		mysql_close($connection);
		return $result;
	}
	public static function dbFetch($sql){
		$connection = mysql_connect(self::$Host,self::$root,self::$pass) or
		die ("couldn't connect to localhost");

		mysql_select_db(self::$db,$connection);
		mysql_query("set names 'utf8'");
		$query = mysql_query($sql,$connection);
		$result=mysql_fetch_assoc($query);
		

		mysql_close($connection);
		return $result;

	}
}
?>