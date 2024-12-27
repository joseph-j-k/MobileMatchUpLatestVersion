<?php
include("../Assets/Connection/Connection.php");
include('Header.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mobile Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 50%;
            margin: auto;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border: 2px solid red; /* Red border for the table */
        }
        td {
            padding: 20px; /* Increased padding for more space */
            text-align: left;
            border: 1px solid #ddd;
            line-height: 1.6; /* Increased line height for better readability */
        }
        img {
            display: block;
            margin: 0 auto 15px; /* More space below the image */
            border: 2px solid red; /* Red border around the image */
            border-radius: 10px; /* Rounded corners for the image */
        }
        a {
            display: inline-block;
            margin-top: 15px; /* More space above the button */
            padding: 10px 15px;
            background-color: red; /* Change button color to red */
            color: white; /* Change text color to white for contrast */
            text-decoration: none;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        a:hover {
            background-color: darkred; /* Change to dark red on hover */
        }
    </style>
</head>
<body>
<table cellpadding="10" align="center" cellspacing="60" id="result">
  <tr>
    <?php
    $se = "SELECT * FROM tbl_mobile m INNER JOIN tbl_mobiledetails d ON m.mobile_id = d.mobile_id WHERE m.mobile_id = '".$_GET['mid']."'";
    $data = $con->query($se);
    $rows = $data->fetch_assoc();
    ?>
    <td>
      <img src="../Assets/Files/MobileDocs/<?php echo $rows['mobiledetails_photo'] ?>" width="150" height="150" alt="">
      <strong>Name:</strong> <?php echo $rows["mobile_name"] ?><br />
      <strong>Price:</strong> <?php echo $rows["mobile_price"] ?><br />
      <strong>Model:</strong> <?php echo $rows["mobile_model"] ?><br />
      <strong>Color:</strong> <?php echo $rows['mobiledetails_color'] ?><br />
      <strong>RAM:</strong> <?php echo $rows['mobiledetails_ram'] ?><br />
      <strong>Storage:</strong> <?php echo $rows['mobiledetails_storage'] ?><br />
      <strong>Processor:</strong> <?php echo $rows['mobiledetails_processor'] ?><br />
      <strong>Display:</strong> <?php echo $rows['mobiledetails_display'] ?><br />
      <strong>Front Camera:</strong> <?php echo $rows['mobiledetails_frontcam'] ?><br />
      <strong>Back Camera:</strong> <?php echo $rows['mobiledetails_rearcam'] ?><br />
      <a href="#" onclick="addCart(<?php echo $rows['mobile_id'] ?>)">Add to Cart</a>
    </td>
  </tr>
</table>
</body>
</html>
<?php
include('Footer.php');
?>

