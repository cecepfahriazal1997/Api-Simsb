<?php
defined('BASEPATH') or exit('No direct script access allowed');
class GeneralModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }
    
    public function replaceArrayNull($array) {
       foreach ($array as $key => $value) {
           if(is_array($value)) {
               $array[$key] = $this->replaceArrayNull($value);
            } else {
               if (is_null($value))
                   $array[$key] = "";
           }
       }
       return $array;
   }
}
?>