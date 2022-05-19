<?php
$conn = require "conn.php";
//$sql = "SELECT category_class.category_class_name, category_group.category_group_name, category_group_item.group_item_name
//    FROM category
//    LEFT JOIN category_class
//        ON category.id = category_class.category_id
//    LEFT JOIN category_group
//        ON category_class.category_group_id = category_group.category_group_id
//    LEFT JOIN category_group_item
//        ON category_group.category_group_item_id = category_group_item.group_item_id;";

$sqlAllCategoryClass = "SELECT category.id, category_class_name
    FROM category
     INNER JOIN category_class
      ON category.id = category_class.category_id";

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
<div class="container">

    <h3>Please enter your name and pick the Sectors you are currently involved in.</h3>

    Name:

    Sectors:
    <div class="select-container pt-3">
      <?php
//      $data = $conn->query($sql)->fetchAll();
      $getClassNames = $conn->query($sqlAllCategoryClass)->fetchAll();
      ?>

        <select name="sectors" id="select">
            <optgroup label="Manufacturing">
              <?php
              foreach ($getClassNames as $item) {

                ?>
                  <option value="<?php echo $item['category_class_name']; ?>"><?php echo $item['category_class_name']; ?></option>
                <?php
              }
              ?>
            </optgroup>
            <optgroup label="Other">

            </optgroup>
            <optgroup label="Service">

            </optgroup>
        </select>
    </div>


    <input type="checkbox"> Agree to terms

    <input type="submit" value="Save">
</div>

</body>
</html>