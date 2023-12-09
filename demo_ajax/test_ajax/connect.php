<?php
$host = 'localhost';
$db = 'db_cn_web';
 
$charset = 'utf8mb4';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
 
try {
 $conn = new PDO($dsn, "root", "");
} 
catch (\PDOException $e) {
  die($e);
}
