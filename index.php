<?php require_once('./components/header.php'); ?>
    
    <div class="container horizontal-center-wrapper">
        <div class="horizontal-center">
        <h1 class="text-center">Testa uzdevums</h1>
        <form action="quiz.php" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input required type="text" class="form-control" id="username" name="username" placeholder="Enter your name">
            </div>
            <div class="form-group">
                <label for="inputState">Test</label>
                <select id="inputState" name="test" class="form-control">
                    <?php
                        $result = $db->getTests();
                        while($row = $result->fetch_object()) echo'<option value="'.$row->id.'">'.ucfirst($row->title).'</option>';
                    ?>
                </select>
            </div>
            <div class="custom-control custom-checkbox mr-sm-2 mb-3">
                <input type="checkbox" class="custom-control-input" name="cheatMode" id="cheatMode">
                <label class="custom-control-label" for="cheatMode">Enter cheat mode</label>
            </div>
            <input type="submit" class="btn btn-primary" value="Start" />
        </form>
        </div>
    </div>


<?php require_once('./components/footer.php'); ?>