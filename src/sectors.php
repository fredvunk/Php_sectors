<?php
session_start();
$conn = require "conn.php";
$sqlGetCategories = "SELECT * FROM category;";
$categories = $conn->query($sqlGetCategories)->fetchAll();
$currentUser = $_SESSION['active_user'];

function prettyPrint($value)
{
    echo "<pre>";
    print_r($value);
    echo "<pre>";
}

function addSpaceBetween($int)
{
    $string = '&nbsp;';

    return str_repeat($string, $int);
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<div class="container pt-4">

    <h3>Please pick the Sectors you are currently involved in.</h3>

    <?php
    echo "<p>Name: $currentUser</p>"
    ?>

    Sectors:
    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>">

        <div class="select-container pt-3 mb-4">

            <?php
            echo "<select name='categories[]' multiple class='h-100'>";
            foreach ($categories as $category) {
                echo "<option value='" . $category['category_name'] . "'>" . $category['category_name'] . "</option>";
                $sqlGetCategoryClass = "SELECT * FROM category_class WHERE category_id ='" . $category['id'] . "';";
                $categoriesClass = $conn->query($sqlGetCategoryClass)->fetchAll();
                foreach ($categoriesClass as $class) {
                    echo "<option value='" . $class['category_class_name'] . "'>" . addSpaceBetween(4) . $class['category_class_name'] . "</option>";
                    $sqlGetCategoryGroup = "SELECT * FROM category_group WHERE category_class_id ='" . $class['category_class_id'] . "';";
                    $categoriesGroups = $conn->query($sqlGetCategoryGroup)->fetchAll();
                    foreach ($categoriesGroups as $group) {
                        echo "<option value='" . $group['category_group_name'] . "'>" . addSpaceBetween(8) . $group['category_group_name'] . "</option>";
                        $sqlGetCategoryGroupItem = "SELECT * FROM category_group_item WHERE group_item_id = '" . $group['category_group_item_id'] . "';";
                        $categoriesGroupItems = $conn->query($sqlGetCategoryGroupItem)->fetchAll();
                        foreach ($categoriesGroupItems as $item) {
                            echo "<option value='" . $item['group_item_name'] . "'>" . addSpaceBetween(12) . $item['group_item_name'] . "</option>";
                        }
                    }
                }
            }
            echo "</select>";
            ?>
        </div>

        <?php
        if (isset($_POST['save'])) {
            if (empty($_POST['checkbox'])) {
                $error = "Agree to terms is mandatory";
                echo "<p class='text-danger'>$error</p>";
            } else {
                $sql = "SELECT username, accepted FROM terms WHERE username = '" . $currentUser . "' AND accepted = true";
                $hasUserAgreedToTerms = $conn->query($sql)->fetch();

                if ($hasUserAgreedToTerms['accepted'] !== 1 && empty($hasUserAgreedToTerms['username'])) {
                    $sql = "INSERT INTO terms (username, accepted) VALUES ('" . $currentUser . "', true)";
                    $conn->query($sql)->execute();

                    addCategories($conn, $currentUser);
                } else {
                    $_SESSION['terms_accepted'] = $hasUserAgreedToTerms['accepted'];
                }
            }
        }

        function addCategories($conn, $currentUser)
        {
            if (isset($_POST['save'])) {
                if ($_POST['categories']) {
                    $array = $_POST['categories'];
                    foreach ($array as $item) {
                        $sql = "INSERT INTO user_category_preference (username, category_name) VALUES ('" . $currentUser . "', '" . $item . "')";
                        $conn->query($sql)->execute();

                    }
                }
            }
        }

        if ($_SESSION['terms_accepted']) {
            addCategories($conn, $currentUser);
        }

        function selectedCategories($conn, $currentUser)
        {
            $sql = "SELECT category_name FROM user_category_preference WHERE username = '" . $currentUser . "'";
            $data = $conn->query($sql)->fetchAll();

            return $data;
        }

        ?>

        <input type="checkbox" value="checkbox" name="checkbox" class="mt-2"
            <?php if (($_SESSION['terms_accepted'] == true || $_POST['checkbox']) ? 'checked' : '') {
                echo 'checked';
            } ?>
        > Agree to terms</input>
        <input type="submit" value="Save" name="save">
    </form>

</div>

</body>
</html>