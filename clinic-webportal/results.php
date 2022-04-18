<?php
    session_start();
    $_SESSION["provider_name"] = $_POST["prov_name"];
    $_SESSION["member_ID"] = $_POST["mem_ID"];
    $_SESSION["subscriber_ID"] = $_POST["sub_ID"];
    $_SESSION["group_num"] = $_POST["grp_num"];
    $_SESSION["subscriber_name"] = $_POST["sub_name"];
    $_SESSION["subscriber_DOB"] = $_POST["sub_DOB"]; //need to format this date in order to insert into DB
    
    $appt_specialty = $_SESSION["appt_specialty"];
    $appt_reason = $_SESSION["appt_reason"];
    $appt_date = $_SESSION["appt_date"];
    $appt_description = $_SESSION["appt_descrip"];
    
    
    $pat_id = $_SESSION["patient_ID"];
    $f_name = $_SESSION["f_name"];
    $l_name = $_SESSION["l_name"];
    $pat_DOB = $_SESSION["patient_DOB"];
    $pat_race = $_SESSION["patient_race"];
    $pat_ethnicity = $_SESSION["patient_ethnicity"];
    $pat_sex = $_SESSION["patient_sex"];
    $pat_email = $_SESSION["patient_email"];
    $pat_phone = $_SESSION["patient_phone"];
    $pat_address = $_SESSION["patient_address"];
    $pat_city = $_SESSION["patient_city"];
    $pat_state = $_SESSION["patient_state"];
    $pat_zipcode = $_SESSION["patient_zipcode"];
    
    $provider_id;
    $provider_name = $_SESSION["provider_name"];
    $value2 = $_SESSION["member_ID"];
    $value3 = $_SESSION["subscriber_ID"];
    $value4 = $_SESSION["group_num"];
    $value5 = $_SESSION["subscriber_name"];
    $value6 = $_SESSION["subscriber_DOB"];
    
    
    // Change to switch case
    if($provider_name == "United Healthcare"){
        $_SESSION["provider_id"] = 10000; 
    }
    else if($provider_name == "Blue Cross"){
        $_SESSION["provider_id"] = 10001; 
    }
    else if($provider_name == "AARP Medicare Supplemental"){
        $_SESSION["provider_id"] = 10002; 
    }
    else if($provider_name == "Allegiance"){
        $_SESSION["provider_id"] = 10003; 
    }else if($provider_name == "Dell Childrens CHIP"){
        $_SESSION["provider_id"] = 10004; 
    }
    else if($provider_name == "Dell Childrens Star"){
        $_SESSION["provider_id"] = 10005; 
    }
    else if($provider_name == "Humana"){
        $_SESSION["provider_id"] = 10006; 
    }else if($provider_name == "No Insurance"){
        $_SESSION["provider_id"] = 10007; 
    }
    else{
        $_SESSION["provider_id"] = 00000;
    }
    
    $provider_id = $_SESSION["provider_id"];
    $data_missing = $_SESSION["missing_array"];
?>
<html>
    <body>
        <?php
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
            
            echo '<tr><td align="left">' .
                $pat_id . '</td><td align="left">' .
                $f_name . '</td><td align="left">' .
                $l_name . '</td><td align="left">' .
                $pat_DOB . '</td><td align="left">' .
                $pat_race . '</td><td align="left">' .
                $pat_ethnicity . '</td><td align="left">' .
                $pat_sex . '</td><td align="left">' .
                $pat_email . '</td><td align="left">' .
                $pat_phone . '</td><td align="left">' .
                $pat_address . '</td><td align="left">' .
                $pat_city . '</td><td align="left">' .
                $pat_state . '</td><td align="left">' .
                $pat_zipcode . '</td><td align="left">' ;
             echo '</tr>';
             
             echo '
            <tr>
                <td align="left"<b>Appointment Specialty</b></td>
                <td align="left"<b>Appointment Reason</b></td>
                <td align="left"<b>Appointment Date</b></td>
                <td align="left"<b>Description</b></td>
            </tr>';
            
             echo '<tr><td align="left">' .
                $appt_specialty . '</td><td align="left">' .
                $appt_reason . '</td><td align="left">' .
                $appt_date . '</td><td align="left">' .
                $appt_description . '</td><td align="left">' ;
            echo '</tr>';
            
            echo 
            '<tr>
                <td align="left"<b>Provider ID</b></td>
                <td align="left"<b>Provider</b></td>
                <td align="left"<b>Member ID</b></td>
                <td align="left"<b>Subscriber ID</b></td>
                <td align="left"<b>Group Number</b></td>
                <td align="left"<b>Subscriber Name</b></td>
                <td align="left"<b>Subscriber DOB</b></td>
            </tr>';
            
            echo '<tr><td align="left">' .
                $provider_id . '</td><td align="left">' .
                $provider_name . '</td><td align="left">' .
                $value2 . '</td><td align="left">' .
                $value3 . '</td><td align="left">' .
                $value4 . '</td><td align="left">' .
                $value5 . '</td><td align="left">' .
                $value6 . '</td><td align="left">' ;
            echo '</tr>';
            echo "</table>";
            
            session_destroy();
            
        if(empty($data_missing)){
            require_once("../mysqli_connect.php");
            
            //insertPatientAppointment();
            //insertPatientInfo();
            //insertPatientInsuarnceInfo();
            
            $insert_pat_info_query = "Insert INTO patient (patient_id, f_name, l_name, birth_date, race, ethnicity, sex, email, phone_number, address, city, state, zipcode) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            // $insert_pat_insur_query = "Insert INTO pat_insurance (patient_id, company_id, insurance_name) VALUES (?,?,?)";
            
            $stmt = mysqli_prepare($conn, $insert_pat_info_query);
            // $stmt2 = mysqli_prepare($conn, $insert_pat_insur_query);
    
            mysqli_stmt_bind_param($stmt, "sssssssssssss", $pat_id, $f_name, $l_name, $pat_DOB, $pat_race, $pat_ethnicity, $pat_sex, $pat_email, $pat_phone, $pat_address, $pat_city, $pat_state, $pat_zipcode);
            // mysqli_stmt_bind_param($stmt2, "sis", $pat_id, $provider_id, $provider_name);
        
            mysqli_stmt_execute($stmt);
            // mysqli_stmt_execute($stmt2);
    
            $affected_rows = mysqli_stmt_affected_rows($stmt);
    
            if($affected_rows == 1){
                mysqli_stmt_close($stmt);
                // mysqli_close($conn);
                // header("Location: https://helix-medical-clinic.azurewebsites.net/clinic-webportal/insurance.php");
                // header("refresh:5;url=https://helix-medical-clinic.azurewebsites.net/clinic-webportal/getpatientinfo.php");
                // exit();
            }
            
            else{
                echo "Error Occured<br />";
                echo mysqli_error();
    
                mysqli_stmt_close($stmt);
                // mysqli_stmt_close($stmt2);
    
                mysqli_close($conn);
            } 
        }
                
        else{
            echo "You need to enter the following data<br />";
            foreach($data_missing as $missing){
                echo "$missing<br />";
            }
        }
        
        //Appointment
        $appt_id = rand(10000, 99999);
        $nurse_id = "1955126";
        $doctor_id = "1842242";
        $appt_start_time = "2022-04-01 08:00:00";
        $appt_end_time = "2022-04-01 09:30:00";
        $office_id = "100";
        $room_num = 2;
        //$appt_description
        
        $insert_pat_appt_query = "INSERT INTO appointment (appt_id, patient_id, nurse_id, doctor_id, start, end, office_id, room_num, reason_appt) VALUES (?,?,?,?,?,?,?,?,?)";
        $stmt3 = mysqli_prepare($conn, $insert_pat_appt_query);
        mysqli_stmt_bind_param($stmt3, "ssssddsis", $appt_id, $pat_id, $nurse_id, $doctor_id, $appt_start_time, $appt_end_time, $office_id, $room_num,  $appt_description);
        mysqli_stmt_execute($stmt3);
        $affected_rows = mysqli_stmt_affected_rows($stmt3);
        if($affected_rows == 1){
            mysqli_stmt_close($stmt3);
        }else{
            echo "Error Occured<br />";
            echo mysqli_error($conn);
            mysqli_stmt_close($stmt3);
            mysqli_close($conn);
        } 
        
        // INSURANCE
        $insert_pat_insur_query = "Insert INTO pat_insurance (patient_id, company_id, insurance_name) VALUES (?,?,?)";
        $stmt2 = mysqli_prepare($conn, $insert_pat_insur_query);
        mysqli_stmt_bind_param($stmt2, "sis", $pat_id, $provider_id, $provider_name);
        mysqli_stmt_execute($stmt2);
        $affected_rows = mysqli_stmt_affected_rows($stmt2);
        if($affected_rows == 1){
            mysqli_stmt_close($stmt2);
            mysqli_close($conn);
            header("refresh:5;url=https://helix-medical-clinic.azurewebsites.net/clinic-webportal/getpatientinfo.php");
            exit();
        }
        else{
            echo "Error Occured<br />";
            echo mysqli_error();
            mysqli_stmt_close($stmt2);
            mysqli_close($conn);
        } 
        
        ?>
    </body>
</html>