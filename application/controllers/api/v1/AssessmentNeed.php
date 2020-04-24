<?php
defined('BASEPATH') or exit('No direct script access allowed');
use chriskacerguis\RestServer\RestController;

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

class AssessmentNeed extends RestController
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/AssessmentNeedModel", "model");
    }

    public function listData_get() {
        $response           = array();
        $listData           = $this->model->getData(null);

        if (count($listData) > 0) {
            $response['status']     = '1';
            $response['message']    = 'Data berhasil ditemukan !';
            $response['data']       = $listData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
        }

        $this->response($response, 200);
    }

    public function saveData_post() {
        $id             = $this->post('id');
        $location       = $this->post('location');
        $date           = $this->post('date');
        $cases          = $this->post('cases');
        $diseases       = $this->post('diseases');
        $service        = $this->post('service');
        $place          = $this->post('place');
        $medicalE       = $this->post('medicalE');
        $supportingE    = $this->post('supportingE');
        $drug           = $this->post('drug');
        $medicalS       = $this->post('medicalS');
        $nonMedicalS    = $this->post('nonMedicalS');
        $general        = $this->post('general');
        $specialistD    = $this->post('specialistD');
        $nurse          = $this->post('nurse');
        $nonMedical     = $this->post('nonMedical');
        $ambulance      = $this->post('ambulance');
        $relatedTransportation  = $this->post('relatedTransportation');
        $communication          = $this->post('communication');
        $createAt               = date('Y-m-d');
        $response               = array();

        $param              = array();
        $param['location']  = $location;
        $param['waktu']     = $date;
        $param['tgl']       = $createAt;
        $param['cases']     = $cases;
        $param['diseases']  = $diseases;
        $param['service']   = $service;
        $param['place']     = $place;
        $param['medicalE']  = $medicalE;
        $param['supportingE']   = $supportingE;
        $param['drug']          = $drug;
        $param['medicalS']      = $medicalS;
        $param['nmedicalS']     = $nonMedicalS;
        $param['general']       = $general;
        $param['specialistD']   = $specialistD;
        $param['nurse']         = $nurse;
        $param['nmedical']      = $nonMedical;
        $param['ambulance']     = $ambulance;
        $param['relatedtr']     = $relatedTransportation;
        $param['com']           = $communication;

        $prosesData             = false;

        if (empty($id)) {
            $prosesData         = $this->model->insertData($param);
        } else {
            $prosesData         = $this->model->updateData($id, $param);
        }

        if ($prosesData) {
            $response['status']     = '1';
            $response['message']    = 'Data berhasil disimpan !';
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data gagal disimpan !';
        }

        $this->response($response, 200);
    }

    public function deleteData_post() {
        $id             = $this->post('id');
        $response       = array();

        if (!empty($id)) {
            $prosesData             = $this->model->deleteData($id);
            if ($prosesData) {
                $response['status']     = '1';
                $response['message']    = 'Data berhasil dihapus !';
            } else {
                $response['status']     = '0';
                $response['message']    = 'Data gagal dihapus !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak terdaftar didalam sistem !';
        }

        $this->response($response, 200);
    }
}
?>