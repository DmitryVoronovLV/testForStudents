<?php 
    if ($_POST && isset($_POST["qid"])){
        require_once('./DataBase.php'); 
        $db2 = new DataBase() or exit("No");
        $answers = $db2->getAnswers((int)$_POST["qid"]);
        // var_dump($answers);


        echo "<div class='grid'>";
        $center = "";
        while ($row = $answers->fetch_object()){
            if(rand(0,1)) $center.= "<button value='".$row->id."' class='btn btn-outline-primary' type='button' onClick='buttonClick(this.value)'>$row->text</button>";
            else $center = "<button value='".$row->id."' class='btn btn-outline-primary' type='button' onClick='buttonClick(this.value)'>$row->text</button>" . $center;
        }
        echo $center;
        echo "</div>";

    } else {
        die("no");
    }


    // <h2>question title</h2>
    //     <div class="grid">
    //     question answers
    //     </div>
?>