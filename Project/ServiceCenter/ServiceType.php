<?php
include('../Assets/Connection/Connection.php');
include('Header.php');

if(isset($_POST['btnadd'])) {
    $Service = $_POST['txtservice'];
    $Details = $_POST['details'];
    $Rate = $_POST['rate'];

    // Prepare statement to check for existing service type
    $stmt = $con->prepare("SELECT * FROM tbl_servicetype WHERE servicetype_type = ?");
    $stmt->bind_param("s", $Service);
    $stmt->execute();
    $res = $stmt->get_result();

    if($res->num_rows > 0) {
        echo "<script>alert('Service Type already exists');</script>";
    } else {
        // Insert new service type
        $insStmt = $con->prepare("INSERT INTO tbl_servicetype (servicetype_type, servicetype_details, servicetype_rate, servicecenter_id) VALUES (?, ?, ?, ?)");
        $serviceCenterId = $_SESSION["sid"];
        $insStmt->bind_param("ssdi", $Service, $Details, $Rate, $serviceCenterId);
        
        if($insStmt->execute()) {
            echo "<script>alert('Service Type added successfully');</script>";
        }
        $insStmt->close();
    }
    $stmt->close();
}

if(isset($_GET["delID"])) {
    $ServiceId = intval($_GET["delID"]);
    $delStmt = $con->prepare("DELETE FROM tbl_servicetype WHERE servicetype_id = ?");
    $delStmt->bind_param("i", $ServiceId);

    if($delStmt->execute()) {
        header("Location: ServiceType.php");
        exit();
    }
    $delStmt->close();
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Service Types</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 80%;
            margin: 50px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ff4d4d;
        }
        th, td {
            padding: 15px;
            text-align: center;
        }
        th {
            background-color: #ff4d4d;
            color: white;
            font-size: 18px;
        }
        td {
            background-color: #fff;
            color: #333;
            transition: background-color 0.3s;
        }
        td:hover {
            background-color: #f1f1f1;
        }
        .add-button {
            text-decoration: none;
            color: #fff;
            background-color: #28a745; /* Green */
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .add-button:hover {
            background-color: #218838; /* Darker green */
        }
        .delete-button {
            text-decoration: none;
            color: #fff;
            background-color: #6c757d; /* Grey */
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .delete-button:hover {
            background-color: #5a6268; /* Darker grey */
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
            width: 50%;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #28a745; /* Green */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838; /* Darker green */
        }
    </style>
</head>
<body>
<form id="form1" name="form1" method="post" action="">
    <table width="200" border="1">
        <tr>
            <td>Service</td>
            <td><input type="text" name="txtservice" id="txtservice" required /></td>
        </tr>
        <tr>
            <td>Details</td>
            <td><input type="text" name="details" id="details" required /></td>
        </tr>
        <tr>
            <td>Rate</td>
            <td><input type="text" name="rate" id="rate" required /></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" name="btnadd" id="btnadd" value="Add" /></td>
        </tr>
    </table>
</form>
<br />
<table border="1" align="center">
<tr>
    <td>SLNO</td>
    <td>Name</td>
    <td>Service</td>
    <td>Details</td>
    <td>Rate</td>
    <td>Action</td>
</tr>
<?php
$selquery = "SELECT * FROM tbl_servicetype p INNER JOIN tbl_servicecenter d ON p.servicecenter_id = d.servicecenter_id";
$result = $con->query($selquery);
$i = 0;
while($data = $result->fetch_assoc()) {
    $i++;
    ?>
    <tr>
        <td><?php echo $i ?></td>
        <td><?php echo htmlspecialchars($data["servicecenter_name"]) ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_type"]) ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_details"]) ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_rate"]) ?></td>
        <td><a class="delete-button" href="ServiceType.php?delID=<?php echo $data["servicetype_id"] ?>">DELETE</a></td>
    </tr>
    <?php
}
?>
</table>
</body>
</html>
<?php
include('Footer.php');
?>



