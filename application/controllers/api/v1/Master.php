<?php
defined('BASEPATH') or exit('No direct script access allowed');
require(APPPATH.'/libraries/REST_Controller.php');

/**
 * @author     Cecep Rokani | cecepfahriazal1997@gmail.com
 * @copyright  2019 Cecep Rokani
 * @version    Auth API 1.0
 * 
 *  =========================================================================
 *  Ketika code akan dirubah, silahkan ubah @version . contoh :
 *  Sebelum diubah -> Auth API 1.0
 *  Setelah diubah -> Auth API 1.1 (Fixing flow login) - Edited by : John Doe
 *  ==========================================================================
 */

class Master extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/MasterModel", "model");
    }

    public function dataMasterStatic_get() {
        $type           = $this->get('type');
        $response       = array();
        $temp           = array();
        
        $data           = $this->model->masterStatic($type);
        $index          = 1;
        foreach ($data as $row) {
            $param          = array();
            $param['id']    = $index;
            $param['title'] = $row;
            $temp[]         = $param;
            $index++;
        }

        $response['status'] = true;
        $response['data']   = $temp;
        $this->response($response);
    }

    public function listCountries_get() {
        $listData       = $this->model->getCountries();
        $response       = array();
        if (count($listData) > 0) {
            $response['status']     = '1';
            $response['message']    = '';
            $response['data']       = $listData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
        }

        $this->response($response);
    }
}
?>