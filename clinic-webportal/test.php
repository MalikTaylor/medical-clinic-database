<?php
    require_once("../mysqli_connect.php");
    
    if(isset($_POST["appointment-date"])){
        $appt_date = $_POST["appointment-date"];
    }
    
    $select_schedule_query = "SELECT clinic_employee.employee_id, clinic_employee.f_name, clinic_employee.l_name, clinic_employee.doc_img, 
     office.office_name, office.address, 
     work_schedule.workdate, work_schedule.start_time, work_schedule.end_time
     FROM clinic_employee JOIN work_schedule ON clinic_employee.employee_id = work_schedule.employee_id
     JOIN office ON office.office_id = work_schedule.clinic_id
     WHERE workdate = '{$appt_date}'";
    
    $result = @mysqli_query($conn, $select_schedule_query);
    
    if($result){
        
        if(mysqli_num_rows($result) == 0){
            echo "No Appointments Available For This Time";
            exit();
        }
       
        
        while($row=mysqli_fetch_array($result)){
            
           
            
            if($row['employee_id'] == "1946772"){
                $doctor_img = "./images/provider-img.png";
            }
            else if($row['employee_id'] == "1852332"){
                $doctor_img = "./images/provider2-img.png";
            }
            else if($row['employee_id'] == "1842242"){
                $doctor_img = "./images/provider3-img.png";
            }
            
            $date = strtotime($row['workdate']);
            $formatted_date = date('l F j, Y', $date);
            
            ?>
            
            <div class="card-provider">
                <h5 class="card-provider-title"><?= $formatted_date ?></h5>
                 <!--Provider 1 [PLACEHOLDER] -->
                <div class="card-provider-content">
                    <h6><?= $row['f_name'] ?> <?= $row['l_name'] ?>, PA-C</h6>
                    <div class="row">
                        <div class="col-md-2 provider-img" >
                               
                            <img src="<?= $doctor_img ?>" style="width: 100px;"> <!-- Doctor img-->
                            <?php //echo '<img src="data:image/jpeg;base64,'.base64_encode($row['doc_img']). '" style="width: 100px;/>';?>
                        </div>
                        <div class="col-md-6 provider-info">
                            <h6><?= $row['office_name'] ?></h6>
                            <p><?= $row['address'] ?></p>
                            <div class="btn-group">
                                <button class="time-avail-btn btn d-flex align-items-center">7:45 AM</button>
                                <button class="time-avail-btn btn d-flex align-items-center">8:30 AM</button>
                                <button class="time-avail-btn btn d-flex align-items-center">9:20 AM</button>
                                <button class="time-avail-btn btn d-flex align-items-center">12:45 PM</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <?php
        }
        mysqli_free_result($result);
    }
    else{
        echo "Could not issue databse query";
        echo mysqli_error($conn);
    }
    
    mysqli_close($conn);
            
?>
    
