<?php
    session_start();
?>



<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <link href="./styles.css" rel="stylesheet"></link>
        <title>Helix Health Clinic</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: white !important; padding: 40px 40px 40px 0px;"> 
                <a class="navbar-brand" href="./appointment.php">
                    <img src="./images/banner-logo.png" style="width: 200px">
                </a>
                <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div>    
            </nav>
            <div class="row">
                <div class="col-md-9">
                    <h2 class="page-heading">Insurance</h2>
                    
                    <?php
                        display_form();
                        function display_form(){
                        $provider = isset($_SESSION["prov_name"]) ? $_SESSION["prov_name"] : "";
                        $member_ID = isset($_SESSION["mem_ID"]) ? $_SESSION["mem_ID"] : "";
                        $subscriber_ID = isset($_SESSION["sub_ID"]) ? $_SESSION["sub_ID"] : "";
                        $group_num = isset($_SESSION["grp_num"]) ? $_SESSION["grp_num"] : "";
                        $subscriber_name = isset($_SESSION["sub_name"]) ? $_SESSION["sub_name"] : "";
                        $subscriber_DOB = isset($_SESSION["sub_DOB"]) ? $_SESSION["sub_DOB"] : "";
                        
                    ?>
                                    
                    <form class="form-container" action="./results.php" method="POST">
                        <div class="form-field col-md-6">
                            <label for="prov_name">Insurance Provider</label>
                            <select name="prov_name">
                                <option>United Healthcare</option>
                                <option>Blue Cross</option>
                                <option>United Healthcare</option>
                                <option>AARP Medicare Supplemental</option>
                                <option>Allegiance</option>
                                <option>Dell Childrens CHIP</option>
                                <option>Dell Childrens Star</option>
                                <option>Humana</option>
                                <option>No Insurance</option>
                            </select>
                        </div>

                        <div class="form-field col-md-6">
                            <label for="mem_ID">Member ID</label>
                            <input name="mem_ID" type="text" placeholder="Enter Name" value="<?= $member_ID ?>"></input>
                        </div>

                        <div class="form-field col-md-6">
                            <label for="sub_ID">Subscriber ID</label>
                        </div>
                        
                        <div class="form-field col-md-6">
                            <label for="grp_num">Group Number</label>
                            <input name="grp_num" type="text" placeholder="Enter Name" value="<?= $group_num ?>"></input>
                        </div>

                        <div class="form-field col-md-6">
                            <label for="sub_name">Subscriber Name</label>
                            <input name="sub_name" type="text" placeholder="Enter Name" value="<?= $subscriber_name ?>"></input>
                        </div>

                        <div class="form-field col-md-6">
                            <label for="sub_DOB" >Subscriber Date Of Birth</label>
                            <input name="sub_DOB" type="date" placeholder="Enter Name" value="<?= $subscriber_DOB ?>" max="<?php echo date('Y-m-d'); ?>"></input>
                        </div>
                        
                        <div class="form-field col-md-9">
                            <label>Who will be paying for costs not covered by insurance?</label>
                            <button class="btn" type="button" style="border: 1px solid #CCC; margin-right: 15px;">Patient</button>
                            <button class="btn" type="button" style="border: 1px solid #CCC;">Other</button>
                        </div>

                        <div class="form-group container">
                            <div class="col-sm-6 text-center" style="float: left;">
                                <button class="form-btn btn btn-lg" type="button" onclick="history.back()">Back</button>
                            </div>
                            <div class="col-sm-6 text-center" style="float: left;">
                                <button class="form-btn btn btn-lg" type="submit">Schedule</button>
                            </div>
                        </div>
                    </form>
                    <?php
                    }
                    ?>
                </div>
                <div class="progressBar-container col-md-3">
                    <ul class="progressBar">
                        <li>
                            <div class="progressNode grey"></div>
                            <p>Schedule Appointment</p>
                        </li>
                        <li><div class="progressNodeLine grey"></div></li>
                        <li>
                            <div class="progressNode grey"></div>
                            <p>Patient Information</p>
                        </li>
                        <li><div class="progressNodeLine grey"></div></li>
                        <li>
                            <div class="progressNode grey"></div>
                            <p>Insurance Information</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
    </body>

</html>
