<?php
include('../Assets/Connection/Connection.php');

include('Header.php');
if(isset($_GET["acpID"]))
{
	$requestid=$_GET["acpID"];
	$acpqry= "update tbl_request set request_status='1' where request_id=$requestid";
	if($con->query($acpqry))
	{ 
	?>
	<script>
		alert("Accepted");
		window.location="ViewRequests.php";
	</script>
	<?php
	
	}
}
if(isset($_GET["rejID"]))
{
	$requestid=$_GET["rejID"];
	$acpqry= "update tbl_request set request_status='2' where request_id=$requestid";
	if($con->query($acpqry))
	{ 
		?>
		<script>
			alert("Rejected");
			window.location="ViewRequests.php";
		</script>
		<?php
	}
}
?>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Request</title>
</head>
<style>
        body {
            background-color: #fff;
            font-family: Arial, sans-serif;
            color: #333;
        }
        table {
            width: 80%;
            margin: 50px auto;
            border-collapse: collapse;
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
            background-color: #f2f2f2;
            color: #333;
        }
        .a {
            text-decoration: none;
            color: #fff;
            background-color: #ff4d4d;
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .a:hover {
            background-color: #ff1a1a;
        }
    </style>
<body>

<table border="1" align="center">
<tr>

<td>SLNO</td>
<td>Service Center Name</td>
<td>Service Type</td>
<td>User Name</td>
<td>User Email</td>
<td>User Contact</td>
<td>Action</td>
</tr>
<?php
$selquery="select * from  tbl_request r inner join tbl_user u on r.user_id=u.user_id inner join tbl_servicetype t on r.servicetype_id=t.servicetype_id   inner join tbl_servicecenter s on t.servicecenter_id=s.servicecenter_id where s.servicecenter_id=".$_SESSION['sid'];
$result=$con->query($selquery);
$i=0;
while($data = $result -> fetch_assoc())
{
	$i++;
	?>
    <tr>
    <td><?php echo $i?></td>
	<td><?php echo $data["servicecenter_name"] ?></td>
    <td><?php echo $data["servicetype_type"] ?></td>
    <td><?php echo $data["user_name"] ?></td>
    <td><?php echo $data["user_email"] ?></td>
    <td><?php echo $data["user_contact"] ?></td>


   <td><?php

	if($data['request_status']==0)
	{
		?>
		<a href="ViewRequests.php?acpID=<?php echo $data["request_id"]?>" class="btn btn-success btn-block">ACCEPT</a>
		<a href="ViewRequests.php?rejID=<?php echo $data["request_id"]?>" class="btn btn-danger btn-block">REJECT</a></td>
		<?php
	}
	else if($data['request_status']==1)
	{
		?>
		<a href="Sendmail.php?uid=<?php echo $data['user_id']?>">Work Completed</a>
		<?php
	}
    else{
        echo " Request Rejected ";
    }

   ?>
	
   
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