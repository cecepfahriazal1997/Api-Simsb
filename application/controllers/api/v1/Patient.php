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

class Patient extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/PatientModel", "model");
    }

    public function listPatient_get() {
        $listData   = $this->model->getPatient();
        $tempData   = array();
        $response   = array();

        if (count($listData) > 0) {
            foreach ($listData as $row) {
                $tempData[] = $row;
            }
            $response['status']     = '1';
            $response['message']    = '';
            $response['data']       = $tempData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
            $response['data']       = $tempData;
        }
        $this->response($response);
    }

    public function insert_post() {
        $location           = $this->post('location');
        $date               = $this->post('date');
        $number             = $this->post('number');
        $name               = $this->post('name');
        $gender             = $this->post('gender');
        $age                = $this->post('age');
        $weaknessCondition  = $this->post('weaknessCondition');
        $threadCondition    = $this->post('threadCondition');
        $doctorName         = $this->post('doctorName');
        $nurseName          = $this->post('nurseName');
        $supportName        = $this->post('supportName');
        $remark             = $this->post('remark');
        $userInput          = $this->post('userInput');
        $response           = array();

        $pasienId           = $number.'/'.$location.'/'.date('Y', strtotime($date));
        $cekData            = $this->model->getPatientById($pasienId);

        if (empty($cekData->PatientId)) {
            $insert                 = array();
            $insert['PatientId']    = $pasienId;
            $insert['PatientNm']    = $name;
            $insert['Sex']          = $gender;
            $insert['Age']          = $age;
            $insert['Location']     = $location;
            $insert['Time']         = $date;
            $insert['WaknessCon']   = $weaknessCondition;
            $insert['ThreadCon']    = $threadCondition;
            $insert['DoctorNm']     = $doctorName;
            $insert['NurseNm']      = $nurseName;
            $insert['SupportNm']    = $supportName;
            $insert['Remark']       = $remark;
            $insert['UserID']       = $userInput;
            $insert['var1']         = $number;

            $inserData              = $this->model->insertData($insert);
            if ($inserData) {
                $response['status']     = '1';
                $response['message']   = 'Pasien berhasil di inputkan !';
            } else {
                $response['status']     = '0';
                $response['message']   = 'Pasien gagal di inputkan !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien telah terdaftar didalam sistem !';
        }

        $this->response($response);
    }

    public function update_post() {
        $patientId          = $this->post('patientId');
        $location           = $this->post('location');
        $date               = $this->post('date');
        $name               = $this->post('name');
        $gender             = $this->post('gender');
        $age                = $this->post('age');
        $weaknessCondition  = $this->post('weaknessCondition');
        $threadCondition    = $this->post('threadCondition');
        $doctorName         = $this->post('doctorName');
        $nurseName          = $this->post('nurseName');
        $supportName        = $this->post('supportName');
        $remark             = $this->post('remark');
        $response           = array();

        $cekData            = $this->model->getPatientById($patientId);

        if (!empty($cekData->PatientId)) {
            $update                 = array();
            $update['PatientNm']    = $name;
            $update['Sex']          = $gender;
            $update['Age']          = $age;
            $update['Location']     = $location;
            $update['Time']         = $date;
            $update['WaknessCon']   = $weaknessCondition;
            $update['ThreadCon']    = $threadCondition;
            $update['DoctorNm']     = $doctorName;
            $update['NurseNm']      = $nurseName;
            $update['SupportNm']    = $supportName;
            $update['Remark']       = $remark;

            $inserData              = $this->model->updateData($patientId, $update);
            if ($inserData) {
                $response['status']     = '1';
                $response['message']   = 'Data Pasien berhasil di perbaharui !';
            } else {
                $response['status']     = '0';
                $response['message']   = 'Data Pasien gagal di perbaharui !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar didalam sistem !';
        }

        $this->response($response);
    }

    public function delete_post() {
        $patientId          = $this->post('patientId');
        $response           = array();
        
        $cekData            = $this->model->getPatientById($patientId);
        if (!empty($cekData->PatientId)) {
            $deleteData     = $this->model->deleteData($patientId);
            if ($deleteData) {
                $response['status']     = '1';
                $response['message']    = 'Pasien berhasil di hapus !';
            } else {
                $response['status']     = '0';
                $response['message']    = 'Pasien gagal di hapus !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar didalam sistem !';
        }

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

    public function getHistory_get() {
        $patientId          = $this->get('id');
        $response           = array();

        if (!empty($patientId)) {
            $data                   = $this->model->getHistoryById($patientId);
            if (!empty($data->PatientId)) {
                $response['status']     = '1';
                $response['message']    = 'Data berhasil ditemukan !';
                $response['data']       = $data;
            } else {
                $response['status']     = '0';
                $response['message']    = 'Data tidak ditemukan !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Patient tidak terdaftar di dalam sistem !';
        }

        $this->response($response);
    }

    public function saveHistory_post() {
        $patientId          = $this->post('id');
        $typeRecord         = $this->post('typeRecord');
        $symptom            = $this->post('symptom');
        $specific           = $this->post('specific');
        $relationship       = $this->post('relationship');
        $condition          = $this->post('condition');
        $specificCondition  = $this->post('specificCondition');
        $lab                = $this->post('lab');
        $radiologi          = $this->post('radiologi');
        $diagnostic         = $this->post('diagnostic');
        $therapy            = $this->post('therapy');
        $rehability         = $this->post('rehability');
        $remark             = $this->post('remark');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $cekData                    = $this->model->getHistoryById($patientId);
            $data['PatientId']          = $patientId;
            $data['HistoryType']        = $typeRecord;
            $data['Symptom']            = $symptom;
            $data['SpecSymptom']        = $specific;
            $data['FamilyRelated']      = $relationship;
            $data['GenCon']             = $condition;
            $data['SpecCon']            = $specificCondition;
            $data['Laboratory']         = $lab;
            $data['Radiology']          = $radiologi;
            $data['Diagnosis']          = $diagnostic;
            $data['Therapy']            = $therapy;
            $data['Rehabilitation']      = $rehability;
            $data['Remark']             = $remark;
            $data['Diagnosis']          = $userInput;
            if (empty($cekData)) {
                if ($this->model->insertDataHistory($data)) {
                    $response['status']     = '1';
                    $response['message']    = 'Data berhasil ditambahkan !';
                } else {
                    $response['status']     = '0';
                    $response['status']     = 'Data gagal ditambahkan !';
                }
            } else {
                if ($this->model->updateDataHistory($patientId, $data)) {
                    $response['status']     = '1';
                    $response['message']    = 'Data berhasil diperbaharui !';
                } else {
                    $response['status']     = '0';
                    $response['status']     = 'Data gagal diperbaharui !';
                }
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar di sistem !';
        }

        $this->response($response);
    }
}
?>