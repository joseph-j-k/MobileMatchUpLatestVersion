<?php
include('../Assets/Connection/Connection.php');
include('Header.php');

// Fetch user data
$selquery = "SELECT * FROM tbl_user WHERE user_id = ?";
$stmt = $con->prepare($selquery);
$stmt->bind_param("i", $_SESSION['uid']);
$stmt->execute();
$row = $stmt->get_result();
$data = $row->fetch_assoc();

// Handle form submission
if(isset($_POST["btnedit"])) {
    $Name = $_POST["txtname"];
    $Email = $_POST["txtemail"];
    $Contact = $_POST["txtcontact"];
    $Address = $_POST["txtaddress"];

    // Update query
    $Update = "UPDATE tbl_user SET user_name = ?, user_email = ?, user_contact = ?, user_address = ? WHERE user_id = ?";
    $stmt = $con->prepare($Update);
    $stmt->bind_param("ssssi", $Name, $Email, $Contact, $Address, $_SESSION['uid']);

    if ($stmt->execute()) {
        echo '<script>alert("Profile updated successfully"); window.location="MyProfile.php";</script>';
    } else {
        echo '<script>alert("Error updating profile: ' . $stmt->error . '");</script>';
    }
}
?>

<style>
    table {
        width: 300px;
        margin: 20px auto;
        border-collapse: collapse;
        border: 2px solid red; /* Table border color */
    }
    td, th {
        padding: 10px;
        border: 1px solid red; /* Cell border color */
        background-color: white; /* Cell background color */
    }
    th {
        background-color: #ffcccc; /* Optional: Light red header background */
    }
    input[type="text"], input[type="email"], textarea {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: green;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: darkgreen;
    }
</style>

<form id="form1" name="form1" method="post" action="" onsubmit="return validateForm();">
    <table>
        <tr>
            <th>Name</th>
            <td><input type="text" name="txtname" id="txtname" value="<?php echo htmlspecialchars($data['user_name']); ?>" required/></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input type="email" name="txtemail" id="txtemail" value="<?php echo htmlspecialchars($data['user_email']); ?>" required/></td>
        </tr>
        <tr>
            <th>Contact</th>
            <td><input type="text" name="txtcontact" id="txtcontact" value="<?php echo htmlspecialchars($data['user_contact']); ?>" required/></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><textarea name="txtaddress" id="txtaddress" cols="45" rows="5" required><?php echo htmlspecialchars($data['user_address']); ?></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" name="btnedit" id="btnedit" value="Edit" /></td>
        </tr>
    </table>
</form>

<script>
// Form validation function
function validateForm() {
    // Validate name
    var name = document.getElementById("txtname").value;
    if (name.trim() === "") {
        alert("Name is required");
        return false;
    }

    // Validate email
    var email = document.getElementById("txtemail").value;
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert("Invalid email format");
        return false;
    }

    // Validate contact
    var contact = document.getElementById("txtcontact").value;
    var contactPattern = /^[0-9]{10}$/;
    if (!contactPattern.test(contact)) {
        alert("Contact number must be exactly 10 digits");
        return false;
    }

    // Validate address
    var address = document.getElementById("txtaddress").value;
    if (address.trim() === "") {
        alert("Address is required");
        return false;
    }

    return true; // If all validation passes
}
</script>

<?php
include('Footer.php');
?>

