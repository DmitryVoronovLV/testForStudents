<?php

$config = require_once('config.php');

class DataBase{

    private $dbserver;
    private $username;
    private $password;
    private $dbname;
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

    private function getTable($tableName,$fields = "*",$where =""){
        $str = "Select $fields from $tableName";
        if(!empty($where)) $str.= " where ".$where;
        return $this->connection->query($str);
    }

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

    public function getUserId($username){
        $username_t = trim($username);
        $query = $this->getTable('users','*','name = '.trim($username_t));
        if ($query->num_rows == 1){
            return $query->fetch_object()->id;
        } else {
            $this->insertIntoTable('users','(name)',"('$username_t')");
            return $this->getTable('users','*','name = '.trim($username_t))->fetch_object()->id;
        }
    }
    
    public function close(){
        $this->connection->close();
    }
};

?>