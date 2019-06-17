<?php 
    session_start();
    if ($_SESSION && isset($_SESSION["username"],$_SESSION["total"],$_SESSION["correct"])){
        require_once('./components/header.php'); 
    } else {
        $redirect_to = explode('/',$_SERVER["REQUEST_URI"]);
        array_pop($redirect_to);
        header("Location:".implode('/',$redirect_to).'/index.php');
    }
    $db->appendScoreTable($_SESSION["user_id"],$_SESSION["test_id"],$_SESSION["correct"]);
?>

<div class="container horizontal-center-wrapper">
    <div class="horizontal-center">
        <h3 class="text-center text-muted">Thanks, <?php echo $_SESSION["username"]; ?>!</h3>
        <div class="h1 text-center mb-3 pb-3" id="question">You answered on <?php echo $_SESSION["correct"]; ?> / <?php echo $_SESSION["total"]; ?> questions, good job!</div>
        <div class="text-center h4"><a href="./index.php">Pass another test</a></div>
    </div>
</div>

<?php 
    require_once('./components/footer.php'); 
    // once session is destroied, user can mot access this page, immediately being redirected to index
    session_destroy();
    $db->close();
?>