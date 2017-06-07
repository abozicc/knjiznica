<?php

class Fakultet {
	public $id_fakulteta;
	public $naziv_fakulteta;
	
	public function __construct($id_fakulteta, $naziv_fakulteta)  
    {  
        $this->id_fakulteta = $id_fakulteta;
	    $this->naziv_fakulteta = $naziv_fakulteta;
    } 
}

?>