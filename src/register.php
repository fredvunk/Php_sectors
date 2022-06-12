<?php ob_start(); ?>
<!doctype html>
<html lang="en">
<head>
    <title>Show databases in MySQL server</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3>Please create a username to save your data.</h3>

    <?php
    $nameError = "";
    $userNameExistsError = "";
    $err = "<p class='text-warning'></p>";

    if (isset($_POST['register'])) {
        if (empty($_POST['username'])) {
            $nameError = "Username is required";
            echo "<p class='text-danger'>$nameError</p>";
        } else {

            $conn = require "conn.php";
            $username = $_POST['username'];
            $checkIfUsernameExists = $conn->prepare("SELECT username FROM username WHERE username = :username");
            $checkIfUsernameExists->execute(['username' => $username]);
            $user = $checkIfUsernameExists->fetch();

            if ($user['username'] === $username) {
                $userNameExistsError = "Username already exists";
                echo "<p class='text-danger'>$userNameExistsError</p>";;
            } else {
                $query = $conn->prepare("INSERT INTO username (username) VALUES (:username)");
                $query->execute(['username' => $username]);
                session_start();
                $_SESSION['active_user'] = $username;

                header("Location: sectors.php");
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
