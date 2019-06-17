<?php require_once('./header.php'); ?>
    
    <div class="container horizontal-center">
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
            <input type="submit" class="btn btn-primary" value="Start" />
        </form>
    </div>


<?php require_once('./footer.php'); ?>