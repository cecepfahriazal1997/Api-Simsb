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
        $this->load->model("v1/MasterModel", "master");
    }

    public function getProgress_get() {
        $response           = array();
        $data               = $this->model->listProgress(null);
        if (count($data) > 0) {
            $responseData           = array();
            $checkId                = array();
            $listYear               = array();
            foreach ($data as $row) {
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
            $response['message']    = 'Belum ada history progress pada pasien ini !';
        }

        $this->response($response);
    }

    public function getProgressDetail_get() {
        $response           = array();
        $patientId          = $this->get('patientId');
        $data               = $this->model->listProgress($patientId);
        if (count($data) > 0) {
            $responseData           = array();
            $complication           = $this->master->masterStatic('komplikasi');
            $complicationDetail     = $this->master->masterStatic('detailKomplikasi');
            foreach ($data as $row) {
                $detail                     = array();
                $detail['id_prog']          = $row->id_prog;
                $detail['Year']             = $row->Year;
                $detail['Month']            = $row->Month;
                $detail['Week']             = $row->Week;
                $detail['Tgl']              = $row->Tgl;
                $detail['Complication']         = $row->Complication;
                $detail['ComplicationLabel']    = $complication[$row->Complication > 0 ? $row->Complication - 1 : 0];
                $detail['ComplicationDtl']      = $row->ComplicationDtl;
                $indexDetail        = 0;
                if ($row->ComplicationDtl == 'I') {
                    $indexDetail    = 0;
                } elseif ($row->ComplicationDtl == 'S') {
                    $indexDetail    = 1;
                } elseif ($row->ComplicationDtl == 'D') {
                    $indexDetail    = 2;
                }
                $detail['ComplicationDtlLabel'] = $complicationDetail[$indexDetail];
                $detail['Progress']         = $row->Progress;
                $detail['Status']           = $row->Status;
                $detail['Remark']           = $row->Remark;

                $responseData[]             = $detail;
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