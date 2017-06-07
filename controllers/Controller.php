<?php
include_once("models/Model.php");

class Controller {
	public $model;
	
	public function __construct()  
    {  
        $this->model = new Model();

    } 
	
	public function invoke()
	{
		if (!isset($_GET['Fakultet']))
		{
			
			$fakultets = $this->model->getFakultetList();
			include 'view/fakultetlist.php';
		}
		else
		{
			
			$fakultet = $this->model->getFakultet($_GET['Fakultet']);
			include 'view/viewfakultet.php';
		}
	}
}

?>