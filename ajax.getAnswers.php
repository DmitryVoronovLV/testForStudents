<?php 
    if ($_POST && isset($_POST["qid"])){
        session_start();
        require_once('./DataBase.php'); 
        $db2 = new DataBase() or exit("No");
        $answers = $db2->getAnswers((int)$_POST["qid"]);

        // generate grid for answer buttons and buttons themselves
        echo "<div class='grid'>";
        $center = "";
        $button_classes = "btn btn-outline-primary";
        while ($row = $answers->fetch_object()){
            if(isset($_SESSION["cheats"])){
                // once cheats are applied, correct answers become yellow
                $button_classes = ($row->correct)?"btn btn-outline-warning":"btn btn-outline-primary";
            }
            // randomizing the order of questions (append to the front or to the back)
            if(rand(0,1)) $center.= "<button value='".$row->id."' class='$button_classes' type='button' onClick='buttonClick(this.value)'>$row->text</button>";
            else $center = "<button value='".$row->id."' class='$button_classes' type='button' onClick='buttonClick(this.value)'>$row->text</button>" . $center;
        }
        echo $center;
        echo "</div>";

    } else {
        die("not today!");
    }
?>