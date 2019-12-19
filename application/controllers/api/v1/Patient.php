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
        $this->load->model("v1/MasterModel", "master");
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
        $phoneDoctor        = $this->post('phoneDoctor');
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
            $insert['DoctorWA']     = $phoneDoctor;

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
        $phoneDoctor        = $this->post('phoneDoctor');
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
            $update['DoctorWA']     = $phoneDoctor;

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

    public function getHistory_get() {
        $patientId          = $this->get('id');
        $response           = array();

        if (!empty($patientId)) {
            $data                   = $this->model->getHistoryById($patientId);
            if (!empty($data->PatientId)) {
                $param                      = array();
                $specificLabel              = $this->master->masterStatic('gejalaSpesifik');
                $radiologiLabel             = $this->master->masterStatic('radiologi');
                $diagnosticLabel            = $this->master->masterStatic('diagnosis');
                $therapyLabel               = $this->master->masterStatic('terapi');
                $rehabilityLabel            = $this->master->masterStatic('rehabilitas');

                $param['PatientId']         = $patientId;
                $param['HistoryType']       = $data->HistoryType;
                $param['HistoryTypeName']   = ($data->HistoryType == '2' ? 'Bingung' : 'Gagal');
                $param['Symptom']           = $data->Symptom;
                $param['SymptomName']       = ($data->Symptom == '2' ? 'Mengantuk' : 'Sakit');
                $param['SpecSymptom']       = $data->SpecSymptom;
                $param['SpecSymptomName']   = $specificLabel[($data->SpecSymptom > 0 ? $data->SpecSymptom - 1 : $data->SpecSymptom)];
                $param['FamilyRelated']     = $data->FamilyRelated;
                $param['GenCon']            = $data->GenCon;
                $param['SpecCon']           = $data->SpecCon;
                $param['Laboratory']        = $data->Laboratory;
                $param['Radiology']         = $data->Radiology;
                $param['RadiologyName']     = $radiologiLabel[($data->Radiology > 0 ? $data->Radiology - 1 : $data->Radiology)];
                $param['Diagnosis']         = $data->Diagnosis;
                $param['DiagnosisName']     = $diagnosticLabel[($data->Diagnosis > 0 ? $data->Diagnosis - 1 : $data->Diagnosis)];
                $param['Therapy']           = $data->Therapy;
                $param['TherapyName']       = $therapyLabel[($data->Therapy > 0 ? $data->Therapy - 1 : $data->Therapy)];
                $param['Rehabilitation']    = $data->Rehabilitation;
                $param['RehabilitationName']= $rehabilityLabel[($data->Rehabilitation > 0 ? $data->Rehabilitation - 1 : $data->Rehabilitation)];
                $param['Remark']            = $data->Remark;
                $param['UserID']            = $data->UserID;

                $response['status']     = '1';
                $response['message']    = 'Data berhasil ditemukan !';
                $response['data']       = $param;
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
        $patientId          = $this->post('patientId');
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
            $data['Rehabilitation']     = $rehability;
            $data['Remark']             = $remark;
            $data['UserID']             = $userInput;
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