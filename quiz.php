<?php 
if ($_POST && isset($_POST["username"],$_POST["test"])) require_once('./header.php');
else die("bb");

// if(isset($_POST)) var_dump($_POST);
// htmlspecialchars

$test_id = (int) $_POST["test"];

session_start();
$_SESSION["username"] = (int) $db->getUserId(htmlspecialchars($_POST["username"]));
$_SESSION["test"] = (int)$_POST["test"];
var_dump($_SESSION);
// session_destroy();

$questions = json_encode($db->getTestQuestions($test_id)->fetch_all());
?>
    <div class="container horizontal-center">
        <h3 class="text-center text-muted"><?php echo $db->getTestTitle($_POST["test"]); ?></h3>
        <div class="h1 text-center mb-3 pb-3" id="question"></div>
        <div id="result" class="mb-4"></div>
        <div class="progress">
            <div class="progress-bar" id="progress_bar" role="progressbar" style="width: 0%"></div>
        </div>
    </div>

<?php $db->close() ; ?>
    <script>
        var total_count;
        var question_objs;
        var item_num = 0;
        $(document).ready(()=>{
            var test_id = <?php echo $_POST['test'] ?>;
            question_objs = <?php echo $questions ?>;
            total_count = question_objs.length;
            console.log(question_objs,total_count);
            getAnswersFromServer(question_objs[0][0]);
        });

        function getAnswersFromServer(question_id){
            $.ajax({
                type: "POST",
                url: 'answersPost.php',
                data: {qid:question_id},
                success: function(data) {
                    $('#result').html(data);
                },
                error: function() {
                    alert('There was some error performing the AJAX call!');
                }
            })
            $('#question').html(question_objs[0][1])
            question_objs.shift();
        }
        
        function buttonClick(text){
            alert(text);
            item_num++;
            $('#progress_bar').css('width',(item_num/total_count * 100 )+'%');
            if(question_objs.length > 0) getAnswersFromServer(question_objs[0][0]);
        }

    </script>

<?php require_once('./footer.php'); ?>