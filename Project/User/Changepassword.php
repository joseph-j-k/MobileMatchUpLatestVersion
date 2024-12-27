<?php
include('../Assets/Connection/Connection.php');
include('header.php');

if (isset($_POST["btnchangepassword"])) {
    $CurrentPassword = $_POST["txtoldPassword"];
    $NewPassword = $_POST["txtnewPassword"];
    $ReTypePassword = $_POST["txtreTypePassword"];

    // Fetch the user's current password
    $selquery = "SELECT user_password FROM tbl_user WHERE user_id = ?";
    $stmt = $con->prepare($selquery);
    $stmt->bind_param("i", $_SESSION['uid']);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();

    // Verify the current password
    if (password_verify($CurrentPassword, $data["user_password"])) {
        if ($NewPassword === $ReTypePassword) {
            // Hash the new password before storing it
            $hashedNewPassword = password_hash($NewPassword, PASSWORD_DEFAULT);
            $Update = "UPDATE tbl_user SET user_password = ? WHERE user_id = ?";
            $stmt = $con->prepare($Update);
            $stmt->bind_param("si", $hashedNewPassword, $_SESSION['uid']);
            $stmt->execute();

            echo '<script>alert("Password updated successfully."); window.location="Changepassword.php";</script>';
        } else {
            echo '<script>alert("New passwords do not match.");</script>';
        }
    } else {
        echo '<script>alert("Current password is incorrect.");</script>';
    }
}
?>

<style>
    table {
        width: 301px; /* Adjusted to match existing table width */
        margin: 20px auto;
        border-collapse: collapse;
        border: 2px solid red; /* Table border color */
    }
    th, td {
        padding: 10px;
        border: 1px solid red; /* Cell border color */
        text-align: left;
        background-color: white; /* Cell background color */
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"], input[type="button"] {
        background-color: green; /* Button color */
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: darkgreen; /* Button hover color */
    }
</style>

<form id="form1" name="form1" method="post" action="">
    <table>
        <tr>
            <th width="175" scope="col">Old Password</th>
            <th width="110" scope="col">
                <input type="password" name="txtoldPassword" id="txtoldPassword" required />
            </th>
        </tr>
        <tr>
            <td>New Password</td>
            <td>
                <input type="password" name="txtnewPassword" id="txtnewPassword" required />
            </td>
        </tr>
        <tr>
            <td height="36">Re-Type Password</td>
            <td>
                <input type="password" name="txtreTypePassword" id="txtreTypePassword" required />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input name="btnchangepassword" type="submit" id="btnchangepassword" value="Change Password" />
                <input type="button" name="btncancel" id="btncancel" value="Cancel" onclick="window.location='MyProfile.php';" />
            </td>
        </tr>
    </table>
</form>

<?php
include('Footer.php');
?>
