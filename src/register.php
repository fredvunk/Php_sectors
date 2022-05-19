<?php ob_start(); ?>
<!doctype html>
<html lang="en">
<head>
    <title>Show databases in MySQL server</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3>Please create a username to save your data.</h3>

  <?php
  $nameError = "";

  if (isset($_POST['register'])) {
    if (empty($_POST['username'])) {
      $nameError = "Username is required";
      echo $nameError;
    } else {

      $conn = require "conn.php";
      $username = $_POST['username'];
      $usernameError = "";
      $errors = array();

      $checkIfUsernameExists = $conn->prepare("SELECT username FROM username WHERE username = :username");
      $checkIfUsernameExists->execute(['username' => $username]);
      $user = $checkIfUsernameExists->fetch();

      if ($user['username'] === $username) {
        array_push($errors, "Username already exists");
        echo "Username already exists";
      } else {
        $query = $conn->prepare("INSERT INTO username (username) VALUES (:username)");
        $query->execute(['username' => $username]);
        header("Location: user-data.php");
      }
    }
  }
  ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>">
        <label>Username</label>
        <input type="text" name="username"/>
        <button type="submit" name="register">Register</button>
    </form>
</div>

</body>
</html>
