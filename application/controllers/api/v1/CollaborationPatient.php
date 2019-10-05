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

class CollaborationPatient extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/CollaborationPatientModel", "model");
    }

    public function getCollaboration_get() {
        $response           = array();
        $data               = $this->model->listPatient();
        if (count($data) > 0) {
            $response['status']     = true;
            $response['message']    = '';
            $response['data']       = $data;
        } else {
            $response['status']     = false;
            $response['message']    = 'Data tidak ditemukan !';
        }

        $this->response($response);
    }
    public function getCollaborationDetail_get() {
        $patientId          = $this->get('patientId');
        $response           = array();
        $data               = $this->model->listCollaboration($patientId);
        if (count($data) > 0) {
            $responseData           = array();
            foreach ($data as $row) {
                $detail             = array();
                $detail['id']               = $row->id;
                $detail['Year']             = $row->Year;
                $detail['Month']            = $row->Month;
                $detail['Week']             = $row->Week;
                $detail['Tgl']              = $row->Tgl;
                $detail['Problem']          = $row->Problem;
                $detail['Recommend']        = $row->Recommend;
                $detail['detailId']         = $row->detailId;
                $detail['collaborativeC']   = $row->CollaborativeC;
                $detail['collaborativeD']   = $row->CollaborativeD;
                $detail['feedback']         = $row->Feedback;

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
    
    public function insertCollaboration_post() {
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $problem            = $this->post('problem');
        $recommend          = $this->post('recommend');
        $collaborativeC     = $this->post('collaborativeC');
        $collaborativeD     = $this->post('collaborativeD');
        $feedback           = $this->post('feedback');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Problem']            = $problem;
            $data['Recommend']          = $recommend;
            $data['UserID']             = $userInput;
            
            if ($this->model->insertData('collaboration', $data)) {
                unset($data['Problem']);
                unset($data['Recommend']);

                $data['CollaborativeC']     = $collaborativeC;
                $data['CollaborativeD']     = $collaborativeD;
                $data['Feedback']           = $feedback;

                $this->model->insertData('collaborationdtl', $data);
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

    public function updateCollaboration_post() {
        $id                 = $this->post('id');
        $detailId           = $this->post('detailId');
        $patientId          = $this->post('patientId');
        $year               = $this->post('year');
        $month              = $this->post('month');
        $week               = $this->post('week');
        $day                = $this->post('day');
        $problem            = $this->post('problem');
        $recommend          = $this->post('recommend');
        $collaborativeC     = $this->post('collaborativeC');
        $collaborativeD     = $this->post('collaborativeD');
        $feedback           = $this->post('feedback');
        $userInput          = $this->post('userInput');
        $response           = array();
        $data               = array();

        if (!empty($patientId)) {
            $data['PatientId']          = $patientId;
            $data['Year']               = $year;
            $data['Month']              = $month;
            $data['Week']               = $week;
            $data['Tgl']                = $day;
            $data['Problem']            = $problem;
            $data['Recommend']          = $recommend;
            $data['UserID']             = $userInput;
            
            if ($this->model->updateData('collaboration', $id, $data)) {
                unset($data['Problem']);
                unset($data['Recommend']);

                $data['CollaborativeC']     = $collaborativeC;
                $data['CollaborativeD']     = $collaborativeD;
                $data['Feedback']           = $feedback;

                $this->model->updateData('collaborationdtl', $detailId, $data);
                $response['status']     = '1';
                $response['message']    = 'Data berhasil diperbaharui !';
            } else {
                $response['status']     = '0';
                $response['status']     = 'Data gagal diperbaharui !';
            }
        } else {
            $response['status']     = '0';
            $response['message']    = 'Pasien tidak terdaftar di sistem !';
        }

        $this->response($response);
    }

    public function deleteCollaboration_post() {
        $post               = $this->input->post(null, true);
        $id                 = $this->post('id');
        $detailId           = $this->post('detailId');
        $response           = array();

        if (!empty($id)) {
            $deleteData             = $this->model->deleteData('collaboration', $id);
            if ($deleteData) {
                $this->model->deleteData('collaborationdtl', $detailId);
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