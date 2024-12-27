<?php

include('../Assets/Connection/Connection.php');
include('Header.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Service Centers</title>
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            border: 2px solid red; /* Table border color */
        }
        th, td {
            border: 1px solid red; /* Cell border color */
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #ffcccc; /* Header background color */
        }
        .view-button {
            background-color: green;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .view-button:hover {
            background-color: darkgreen;
        }
    </style>
</head>

<body>

<table>
    <caption>List of Service Centers</caption>
    <tr>
        <th>SLNO</th>
        <th>Name</th>
        <th>Email</th>
        <th>Proof</th>
        <th>District</th>
        <th>Place</th>
        <th>Action</th>
    </tr>
    <?php
    $selquery = "SELECT * FROM tbl_servicecenter s 
                 INNER JOIN tbl_place p ON s.place_id = p.place_id 
                 INNER JOIN tbl_district d ON p.district_id = d.district_id 
                 WHERE center_status = 1";
    
    if ($result = $con->query($selquery)) {
        $i = 0;
        while ($data = $result->fetch_assoc()) {
            $i++;
            ?>
            <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo htmlspecialchars($data["servicecenter_name"]); ?></td>
                <td><?php echo htmlspecialchars($data["servicecenter_email"]); ?></td>
                <td><?php echo htmlspecialchars($data["servicecenter_proof"]); ?></td>
                <td><?php echo htmlspecialchars($data["district_name"]); ?></td>
                <td><?php echo htmlspecialchars($data["place_name"]); ?></td>
                <td><a href="ViewServiceType.php?SID=<?php echo urlencode($data["servicecenter_id"]); ?>" class="view-button">ViewType</a></td>
            </tr>
            <?php
        }
        $result->free();
    } else {
        echo "<tr><td colspan='7'>Error fetching data</td></tr>";
    }
    ?>
</table>
</body>
</html>

<?php
include('Footer.php');
?>
