<?php
include('../Assets/Connection/Connection.php');
include('Header.php');

if(isset($_GET['rid'])) {
    $serviceTypeId = intval($_GET['rid']);
    $userId = intval($_SESSION['uid']);
    
    // Insert request into the database
    $insqry = "INSERT INTO tbl_request (servicetype_id, user_id, request_date) VALUES (?, ?, CURDATE())";
    $stmt = $con->prepare($insqry);
    $stmt->bind_param("ii", $serviceTypeId, $userId);
    $stmt->execute();
    ?>
    <script>
        alert("Request submitted successfully.");
        window.location = "ViewServiceCenter.php";
    </script>
    <?php
    $stmt->close();
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
            padding: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 2px solid #ff0000; /* Bloody red */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ff0000; /* Bloody red */
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
        }
        a.request-button {
            text-decoration: none;
            color: #fff;
            background-color: #28a745; /* Green */
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a.request-button:hover {
            background-color: #218838; /* Darker green */
        }
    </style>
</head>
<body>
<table border="1" align="center">
<tr>
    <th>SLNO</th>
    <th>Service</th>
    <th>Details</th>
    <th>Rate</th>
    <th>Request</th>
</tr>
<?php
$serviceCenterId = intval($_GET['SID']);
$selquery = "SELECT * FROM tbl_servicetype WHERE servicecenter_id = ?";
$stmt = $con->prepare($selquery);
$stmt->bind_param("i", $serviceCenterId);
$stmt->execute();
$result = $stmt->get_result();
$i = 0;

while($data = $result->fetch_assoc()) {
    $i++;
    ?>
    <tr>
        <td><?php echo $i; ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_type"]); ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_details"]); ?></td>
        <td><?php echo htmlspecialchars($data["servicetype_rate"]); ?></td>
        <td><a class="request-button" href="ViewServiceType.php?rid=<?php echo $data["servicetype_id"]; ?>">Request</a></td>
    </tr>
    <?php
}
$stmt->close();
?>
</table>

</body>
</html>
<?php
include('Footer.php');
?>

