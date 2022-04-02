<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <link href="./styles.css" rel="stylesheet"></link>
    <title>Helix Health Center</title>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: white !important; padding: 40px 40px 40px 0px;"> 
            <a class="navbar-brand" href="#">
                <img src="./images/banner-logo.png" style="width: 200px">
            </a>
            <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div>    
        </nav>
        <div class="row">
            <div class="patient-information col-md-9">
                <h2 style="border-bottom: 1px solid #CCC;">Patient Information</h1>
                <form action="https://localhost/clinic-webportal/addedpatient.php" class="form-container" style="padding: 0px;" method="POST">
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="f_name">First Name</label>
                        <input class="name-field" type="text" name="f_name" required>  
                    </div>
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="l_name">Last Name</label>
                        <input class="name-field" type="text" name="l_name" required>  
                    </div>
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="birth_date">Date of Birth</label>
                        <input class="birth-field text-uppercase" type="date" name="birth_date" placeholder="MM-DD-YYYY" required>  
                    </div>
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="race">Race</label>
                        <select name="race" required>
                            <option value="" disable selected hidden>-Select-</option>
                            <option>Black or African American</option>
                            <option>Asian</option>
                            <option>White</option>
                            <option>American Indian or Alaska Native</option>
                            <option>Hawaiian or Other Pacific Islander</option>
                        </select>  
                    </div>
                    
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="ethnicity">Ethnicity</label>
                        <select name="ethnicity" required>
                            <option value="" disable selected hidden>-Select-</option>
                            <option>Non Hispanic</option>
                            <option>Hispanic or LatinX</option>
                        </select>  
                    </div>

                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="sex">Sex (Assigned at Birth)</label>
                        <select name="sex" required>
                            <option value="" disable selected hidden>-Select-</option>
                            <option>Male</option>
                            <option>Female</option>
                        </select>  
                    </div>

                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="email">Email</label>
                        <input class="name-field" type="text" name="email" required>  
                    </div>
                    
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="phone">Phone Number</label>
                        <input class="name-field" type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>  
                    </div>
                    
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="address"></label>Address</label>
                        <input class="name-field" type="text" name="address" required>  
                    </div>
                    
                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="city">City</label>
                        <input class="name-field" type="text" name="city" required>  
                    </div>

                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="state">State</label>
                        <input class="name-field" type="text" name="state" required>  
                    </div>

                    <div class="col-sm-6 form-field" style="float: left;">
                        <label for="zipcode">Zip Code</label>
                        <input class="name-field" type="text" name="zipcode" required>  
                    </div>

                    <div class="form-group container">
                        <div class="col-sm-6 text-center" style="float: left;">
                            <button style="display: inline;" class="form-btn btn btn-lg" type="button" onclick="history.back()">Back</button>
                        </div>
                        <div class="col-sm-6 text-center" style="float: left;">
                            <button id="submit-bt" class="form-btn btn btn-lg" type="submit" name="submit">Submit</button>
                        </div>
                    </div>
                </form>
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

        <!-- <div class="recaptcha-form">
            <form action="?" method="POST">
                <div class="g-recaptcha" data-sitekey="your_site_key"></div>
                <br/>
            </form>

            <div class="form-group container">
                <div class="col-sm-6 text-center" style="float: left;">
                    <button style="display: inline;" class="form-btn btn btn-lg">Cancel</button>
                </div>
                <div class="col-sm-6"style="float: left;">
                    <button id="submit-btn" class="form-btn btn btn-lg g-recaptcha"
                    data-sitekey="reCAPTCHA_site_key" 
                    data-callback='onSubmit' 
                    data-action='submit'>Submit</button>
                </div>
            </div>
        </div> -->
        
       
    </div>
    
</body>
</html>