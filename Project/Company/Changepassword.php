<?php
include('../Assets/Connection/Connection.php');
include('Header.php');
if(isset($_POST["btnchangepassword"]))
{
    $Currentpassword=$_POST["txtoldPassword"];
    $NewPassword=$_POST["txtnewPassword"];
    $ReTypePassword=$_POST["txtreTypePassword"];
    $selquery="select * from tbl_company where company_id='".$_SESSION['company_id']."'";
    $row=$con->query($selquery);
    $data=$row->fetch_assoc();
    $oldPassword=$data["company_password"];
    if($oldPassword==$Currentpassword)
    {
        if($NewPassword==$ReTypePassword)
        {
            $Update="update tbl_user set company_password='$NewPassword' where company_id='".$_SESSION['company_id']."'";
            $con->query($Update);
            ?>
            <script>
                alert("update")
                window.location="Changepassword.php";
            </script>
            <?php
        }
        else
        {
            ?>
            <script>
                alert("Mismatch details")
            </script>
            <?php
        }
    }
    else
    {
        ?>
        <script>
            alert("incorrect password")
        </script>
        <?php
    }
}
?>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }

    table {
        width: 100%;
        max-width: 400px;
        margin: auto;
        border-collapse: collapse;
        background: #ffcccc; /* Light red background */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    th {
        background-color: #ff4c4c; /* Darker red for header */
        color: white;
    }

    td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ff9999; /* Light red border */
    }

    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin: 5px 0 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin: 5px;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    input[type="submit"]:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }

    #btncancel {
        background-color: #f44336; /* Red */
    }

    #btncancel:hover {
        background-color: #d32f2f; /* Darker red */
    }
</style>

<form id="form1" name="form1" method="post" action="">
    <table width="301" border="1">
        <tr>
            <th width="175" scope="col">Old Password</th>
            <th width="110" scope="col"><label for="txtoldPassword"></label>
                <input type="text" name="txtoldPassword" id="txtoldPassword" /></th>
        </tr>
        <tr>
            <td>New Password</td>
            <td><label for="txtnewPassword"></label>
                <input type="text" name="txtnewPassword" id="txtnewPassword" /></td>
        </tr>
        <tr>
            <td height="36">Re-Type Password</td>
            <td><label for="txtreTypePassword"></label>
                <input type="text" name="txtreTypePassword" id="txtreTypePassword" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input name="btnchangepassword" type="submit" id="btnchangepassword" value="Change Password" />&nbsp;&nbsp;
                <input type="submit" name="btncancel" id="btncancel" value="Cancel" /></td>
        </tr>
    </table>
</form>

<?php
include('Footer.php');
?>
