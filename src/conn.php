<?php
$servername = "db";
$username = "MYSQL_USER";
$password = "MYSQL_PASSWORD";
$dbname = "sectors";

try {

  $conn = new PDO("mysql:host=$servername;charset=utf8;dbname=$dbname", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

  return $conn;

} catch (PDOException $e) {
  echo "Connection failed: " . $e;
}
