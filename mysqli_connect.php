<?php

    
    // DEFINE("DB_USER", "root");
    // DEFINE("DB_PASSWORD", "password");
    // DEFINE("DB_HOST", "localhost");
    // DEFINE("DB_NAME", "medicalclinic");

    // $dbc = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
    // OR die("Could not connect to MySQL " . mysqli_connect_error());

    //Get Heroku ClearDB connection information

    $cleardb_url = parse_url(getenv("CLEARDB_DATABASE_URL"));
    $cleardb_server = $cleardb_url["host"];
    $cleardb_username = $cleardb_url["user"];
    $cleardb_password = $cleardb_url["pass"];
    $cleardb_db = substr($cleardb_url["path"],1);
    $active_group = 'default';
    $query_builder = TRUE;
    // Connect to DB
    $conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db)
    OR die("Could not connect to MySQL " . mysqli_connect_error());
?>