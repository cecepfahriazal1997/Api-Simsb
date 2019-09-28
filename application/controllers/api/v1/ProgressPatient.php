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

class ProgressPatient extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/ProgressPatientModel", "model");
    }

    public function getProgress_get() {
        $response           = array();
        $data               = $this->model->listProgress();
        if (count($data) > 0) {
            $tempData               = array();
            $headData               = array();
            $responseData           = array();
            $checkId                = array();
            foreach ($data as $row) {
                $detail             = array();
                if (!in_array($row->PatientId, $checkId)) {
                    $headData[]     = $row;
                    $checkId[]      = $row->PatientId;
                }
                $detail['id_prog']          = $row->id_prog;
                $detail['Year']             = $row->Year;
                $detail['Month']            = $row->Month;
                $detail['Week']             = $row->Week;
                $detail['Tgl']              = $row->Tgl;
                $detail['Complication']     = $row->Complication;
                $detail['ComplicationDtl']  = $row->ComplicationDtl;
                $detail['Progress']         = $row->Progress;
                $detail['Status']           = $row->Status;
                $detail['Remark']           = $row->Remark;

                $tempData[$row->PatientId][]     = $detail;
            }
            
            foreach ($headData as $head) {
                $param              = array();
                $param['PatientId'] = $head->PatientId;
                $param['Sex']       = $head->Sex;
                $param['Age']       = $head->Age;
                $param['SupportNm'] = $head->SupportNm;
                $param['PatientNm'] = $head->PatientNm;
                $param['DoctorNm']  = $head->DoctorNm;
                $param['Time']      = $head->Time;
                $param['History']   = $tempData[$head->PatientId];
                $responseData[]     = $param;
            }

            $response['status']     = '1';
            $response['message']    = 'Data berhasil ditemukan !';
            $response['data']       = $responseData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Belum ada history progress pada pasien ini !';
        }

        $this->response($response);
    }
    
    public function insertProgress_post() {
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $complication       = $this->post('complication');
        $complicationDetail = $this->post('complicationDetail');
        $progress           = $this->post('progress');
        $status             = $this->post('status');
        $remark             = $this->post('remark');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Complication']       = $complication;
            $data['ComplicationDtl']    = $complicationDetail;
            $data['Progress']           = $progress;
            $data['Status']             = $status;
            $data['Remark']             = $remark;
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

        $this->response($response);
    }

    public function updateProgress_post() {
        $id                 = $this->post('id');
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $complication       = $this->post('complication');
        $complicationDetail = $this->post('complicationDetail');
        $progress           = $this->post('progress');
        $status             = $this->post('status');
        $remark             = $this->post('remark');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Complication']       = $complication;
            $data['ComplicationDtl']    = $complicationDetail;
            $data['Progress']           = $progress;
            $data['Status']             = $status;
            $data['Remark']             = $remark;
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

        $this->response($response);
    }

    public function deleteProgress_post() {
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

        $this->response($response);
    }
}
?>