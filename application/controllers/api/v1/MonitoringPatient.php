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

class MonitoringPatient extends RestController
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/MonitoringPatientModel", "model");
    }

    public function getMonitoring_get() {
        $response               = array();
        $listYear               = array();
        $data                   = $this->model->listMonitoring(null);
        if (count($data) > 0) {
            $responseData           = array();
            $checkId                = array();
            foreach ($data as $row) {
                $detail             = array();
                $listYear[]         = $row->Year;
                if (!in_array($row->PatientId, $checkId)) {
                    $responseData[] = (array) $row;
                    $checkId[]      = $row->PatientId;
                }
            }
            
            $response['status']     = '1';
            $response['message']    = 'Data berhasil ditemukan !';
            $response['data']       = $this->general->replaceArrayNull($responseData);
            $response['years']      = array_values(array_filter(array_unique($listYear)));
        } else {
            $response['status']     = '0';
            $response['message']    = 'Belum ada data monitoring pada pasien ini !';
        }

        $this->response($response, 200);
    }

    public function getMonitoringDetail_get() {
        $patientId              = $this->get('patientId');
        $response               = array();
        $data                   = $this->model->listMonitoring($patientId);
        if (count($data) > 0) {
            $tempData               = array();
            $responseData           = array();
            foreach ($data as $row) {
                $detail             = array();
                $detail['id']       = $row->id;
                $detail['Year']     = $row->Year;
                $detail['Month']    = $row->Month;
                $detail['Week']     = $row->Week;
                $detail['Tgl']      = $row->Tgl;
                $detail['Fact']     = $row->Fact;
                $detail['Problem']  = $row->Problem;

                $responseData[]     = $detail;
            }

            $response['status']     = '1';
            $response['message']    = 'Data berhasil ditemukan !';
            $response['data']       = $responseData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Belum ada data monitoring pada pasien ini !';
        }

        $this->response($response, 200);
    }
    
    public function insertMonitoring_post() {
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $fact               = $this->post('fact');
        $problem            = $this->post('problem');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Fact']               = $fact;
            $data['Problem']            = $problem;
            $data['UserID']             = $userInput;
            
            if ($this->model->insertData($data)) {
                $response['status']     = '1';
                $response['message']    = 'Data berhasil ditambahkan !';
            } else {
                $response['status']     = '0';
                $response['status']     = 'Data gagal ditambahkan !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar di sistem !';
        }

        $this->response($response, 200);
    }

    public function updateMonitoring_post() {
        $id                 = $this->post('id');
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $fact               = $this->post('fact');
        $problem            = $this->post('problem');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Fact']               = $fact;
            $data['Problem']            = $problem;
            $data['UserID']             = $userInput;
            
            if ($this->model->updateData($id, $data)) {
                $response['status']     = '1';
                $response['message']    = 'Data berhasil perbaharui !';
            } else {
                $response['status']     = '0';
                $response['status']     = 'Data gagal perbaharui !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar di sistem !';
        }

        $this->response($response, 200);
    }

    public function deleteMonitoring_post() {
        $post               = $this->input->post(null, true);
        $id                 = $this->post('id');
        $response           = array();

        if (!empty($id)) {
            $deleteData             = $this->model->deleteData($id);
            if ($deleteData) {
                $response['status']     = '1';
                $response['message']    = 'Data berhasil dihapus !';
            } else {
                $response['status']     = '0';
                $response['message']    = 'Data gagal dihapus !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data gagal dihapus, data tidak terdaftar disistem !';
        }
        $this->response($response, 200);
    }
}
?>