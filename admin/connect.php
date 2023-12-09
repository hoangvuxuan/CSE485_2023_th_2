<?php
$host = 'localhost';
$db = 'btth02_cse485';
 
$charset = 'utf8mb4';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
 
try {
 $conn = new PDO($dsn, "root", "");
} 
catch (\PDOException $e) {
  die($e);
}
