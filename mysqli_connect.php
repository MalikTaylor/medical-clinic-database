<?php
    DEFINE("DB_USER", "root");
    DEFINE("DB_PASSWORD", "password");
    DEFINE("DB_HOST", "localhost");
    DEFINE("DB_NAME", "medicalclinic");

    $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
    OR die("Could not connect to MySQL " . mysqli_connect_error());
?>