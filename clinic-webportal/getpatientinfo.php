<?php


    require_once("../mysqli_connect.php");

    $return_patient = "SELECT * FROM patient";

    $response = @mysqli_query($conn, $return_patient);

    if($response){
        echo '<table align="left"
        cellspacing="5" cellpadding="8">

        <tr>
            <td align="left"<b>ID</b></td>
            <td align="left"<b>First Name</b></td>
            <td align="left"<b>Last Name</b></td>
            <td align="left"<b>Birth Date</b></td>
            <td align="left"<b>Race</b></td>
            <td align="left"<b>Ethnicity</b></td>
            <td align="left"<b>Sex</b></td>
            <td align="left"<b>Email</b></td>
            <td align="left"<b>Phone Number</b></td>
            <td align="left"<b>Address</b></td>
            <td align="left"<b>City</b></td>
            <td align="left"<b>State</b></td>
            <td align="left"<b>Zipcode</b></td>
        </tr>';

        while($row = mysqli_fetch_array($response)){
            echo '<tr><td align="left">' .
            $row['patient_id'] . '</td><td align="left">' . 
            $row['f_name'] . '</td><td align="left">' .
            $row['l_name'] . '</td><td align="left">' .
            $row['birth_date'] . '</td><td align="left">' .
            $row['race'] . '</td><td align="left">' .
            $row['ethnicity'] . '</td><td align="left">' .
            $row['sex'] . '</td><td align="left">' .
            $row['email'] . '</td><td align="left">' .
            $row['phone_number'] . '</td><td align="left">' .
            $row['address'] . '</td><td align="left">' .
            $row['city'] . '</td><td align="left">' .
            $row['state'] . '</td><td align="left">' .
            $row['zipcode'] . '</td><td align="left">';

            echo '</tr>';
        }

        echo "</table>";
    } else{
        echo "Could not issue databse query";

        echo mysqli_error($conn);
    }

mysqli_close($conn);

?>