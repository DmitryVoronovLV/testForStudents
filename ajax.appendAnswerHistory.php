<?php 
    if ($_POST && isset($_POST["uid"],$_POST["aid"])){
        require_once('./DataBase.php'); 
        $db3 = new DataBase() or exit("No");
        $uid = (int)$_POST["uid"];
        $aid = (int)$_POST["aid"];
        $db3->appendHistory($uid,$aid);
        
        // if answer is correct, $point=1
        $point = (int)$db3->checkIfCorrect($aid);
        
        // in order to access session
        session_start();
        // total score of correct answers 
        $_SESSION["correct"]+=$point;

    } else {
        die("Append Answer History Post Failed");
    } 
?>