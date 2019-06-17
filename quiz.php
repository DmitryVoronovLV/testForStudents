<?php

// get the url of the website.
$index_page_address = explode('/',$_SERVER["REQUEST_URI"]);
array_pop($index_page_address);

if ($_POST && isset($_POST["username"],$_POST["test"])) require_once('./components/header.php');
else {
    // redirect to the index page
    header("Location:".implode('/',$index_page_address).'/index.php');
};
// used later to redirect to the final page after the last question
$redirect_url_to_final_page = implode('/',$index_page_address)."/finish.php";

// I decided to use a session to store necessary, as it is accessible from all web-app pages.
session_start();
$_SESSION["username"] = htmlspecialchars($_POST["username"]);
$_SESSION["user_id"] = (int) $db->getUserId(htmlspecialchars($_POST["username"]));
$_SESSION["test_id"] = (int) $_POST["test"];
// correctly answered questions
$_SESSION["correct"] = 0;
// check for cheat mode
if(isset($_POST["cheatMode"])) $_SESSION["cheats"]='on';

// get all questions of the test from database
$questions_raw = $db->getTestQuestions($_SESSION["test_id"])->fetch_all();
$_SESSION["total"]= sizeof($questions_raw);
// in order to access question array from JS, it should be encoded
$questions = json_encode($questions_raw);
?>

    <div class="container horizontal-center-wrapper">
        <div class="horizontal-center">
            <h3 class="text-center text-muted"><?php echo $db->getTestTitle($_POST["test"]); ?></h3>
            <div class="h1 text-center mb-3 pb-3" id="question"></div>
            <div id="result" class="mb-4"></div>
            <div class="progress">
                <div class="progress-bar" id="progress_bar" role="progressbar" style="width: 0%"></div>
            </div>
        </div>
    </div>

<?php $db->close() ; ?>
<script>
    var total_count;
    var question_objs;
    var item_num = 1;
    // way to pass PHP variables to JS
    var user_id = <?php echo $_SESSION["user_id"]?> ; 
    
    // once document is ready, call for AJAX from JQuerry function to get answers for the first question
    $(document).ready(()=>{
        var test_id = <?php echo $_POST['test'] ?>;
        // earlier encoded string with question ids and questions themselves
        question_objs = <?php echo $questions; ?>;
        total_count = question_objs.length;
        
        // call to AJAX function (parametre is id of the first question)
        getAnswersFromServer(question_objs[0][0]);
    });

    function getAnswersFromServer(question_id){
        $.ajax({
            type: "POST",
            url: 'ajax.getAnswers.php',
            data: {qid:question_id},
            success: function(data) {
                $('#result').html(data);
            },
            error: function() {
                alert('There was some error performing the AJAX call!');
            }
        })
        // append element with answer buttons
        $('#question').html(question_objs[0][1])
        // delete already answered question
        question_objs.shift();
    }

    // another AJAX function. That was the only way to call php function from JS
    function updateAnswerHistoryTable(userId,ansId){
        $.ajax({
            type: "POST",
            url: 'ajax.appendAnswerHistory.php',
            data: {uid:userId, aid:ansId} ,
            success: function(data) {
                console.log([data,'table was appended']);
            },
            error: function() {
                alert('There was some error performing the AJAX call!');
            }
        });
    }

    // AJAX returns answer buttons with assigned onClick function
    function buttonClick(answerId){
        // update progress bar
        $('#progress_bar').css('width',(item_num/total_count * 100 )+'%');
        updateAnswerHistoryTable( user_id, answerId);
        // if there are still questions left, perform AJAX request
        if(question_objs.length > 0) getAnswersFromServer(question_objs[0][0]);
        else{
            // timeout was used just for esthetic purposes
            setTimeout(redirect,1000);
        }
        // increase question num for correct progress bar value
        item_num++;
        var current_score = <?php echo $_SESSION["correct"]; ?>;
    };

    // separated function as setTimeout accepts function
    function redirect(){
        window.location.href = "<?php echo $redirect_url_to_final_page ?>";
    }

</script>

<?php require_once('./components/footer.php'); ?>