<?php
//Setting up variables for ease of use
$servername = "localhost"; 
$username = "root";
$password = "";
$dbname = "db_thesis";

try {
    $db = new PDO("mysql:host=$servername;dbname=".$dbname, $username, $password); //Connecting to the database
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Catching any exceptions occurred when connecting to the database
} catch(PDOException $e) {
    exit($e->getMessage());
}
?>
