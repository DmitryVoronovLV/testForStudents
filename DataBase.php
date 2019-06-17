<?php

$config = require_once('config.php');

class DataBase{

    private $dbserver;
    private $username;
    private $password;
    private $dbname;
    // as this is a sample project, I decided to stick to only one class DataBase, where not only connection, but also data retrieval happens. In a real project there should have been several classes, where one is responsible for connection only, and another one retrieves data. The second one should extend the first one, therefore I put $connection as a protected
    protected $connection;
    
    public function __construct()
    {
        global $config;
        $this->dbserver = $config->host;
        $this->username = $config->username;
        $this->password = $config->password;
        $this->dbname = $config->database;
        try{
            $this->connection = new mysqli($this->dbserver,$this->username,$this->password,$this->dbname);
        } catch(Exception $e){
            echo "Wrong: ".$e;
        }
        return $this->connection;
    }

    // It is impossible to call this method from the outside, only predefined functions, based on this one, are accepted.
    private function getTable($tableName,$fields = "*",$where =""){
        $str = "Select $fields from $tableName";
        if(!empty($where)) $str.= " where ".$where;
        return $this->connection->query($str);
    }

    // -- / --
    private function insertIntoTable($tableName,$fields,$values){
        $str = "Insert into $tableName $fields values $values";
        return  $this->connection->query($str);
    }
    
    public function getTests(){
        return $this->getTable('tests');
    }

    public function getTestTitle($test_id){
        return $this->getTable('tests','title','id = '.$test_id)->fetch_object()->title;
    }

    public function getTestQuestions($test_id){
        return $this->getTable('questions','*',"tid = ".$test_id);
    }

    public function getQuestionIDs($test_id){
        return $this->getTable('questions','id','tid = '.$test_id);
    }

    public function getAnswers($question_id){
        return $this->getTable('answers',"*", 'qid = '.$question_id);
    }

    // according to the task, users can be distinguished only by a name, therefore if there is no such name in database, we create a new user and return user's id.
    public function getUserId($username){
        $username_t = trim($username);
        $query = $this->getTable('users','*',"name = '".$username_t."'");
        if ($query->num_rows == 1){
            return $query->fetch_object()->id;
        } else {
            $this->insertIntoTable('users','(name)',"('".$username_t."')");
            return $this->getTable('users','*',"name = '".$username_t."'")->fetch_object()->id;
        }
    }

    public function appendHistory($user_id, $answer_id){
        $this->insertIntoTable('answer_history','(uid,aid)','('.$user_id.','.$answer_id.')');
    }
    
    public function appendScoreTable($user_id, $test_id, $score){
        $this->insertIntoTable('score_history','(uid,tid,score)','('.$user_id.','.$test_id.','.$score.')');
    }
    
    public function close(){
        $this->connection->close();
    }

    public function checkIfCorrect($answer_id){
        return $this->getTable('answers','correct','id = '.$answer_id)->fetch_object()->correct;
    }
};

?>