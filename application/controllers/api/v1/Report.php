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

class Report extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/ReportModel", "model");
        $this->load->model("v1/MasterModel", "master");
    }

    public function getReportProgress_get() {
        $response           = array();
        $listData           = $this->model->getReportPatient();

        if (count($listData) > 0) {
            $responseData   = array();
            $tempData       = array();
            $listProgress   = array();
            $checkId        = array();
            $complication   = $this->master->masterStatic('komplikasi');

            foreach ($listData as $row) {
                if (!in_array($row->PatientId, $checkId)) {
                    $param              = array();
                    $param['id']        = $row->PatientId;
                    $param['name']      = $row->PatientNm;
                    $param['doctor']    = $row->DoctorNm;
                    $param['nurse']     = $row->NurseNm;
                    $param['gender']    = $row->Sex;
                    $param['age']       = $row->Age;
                    $param['progress']  = array();
                    $tempData[]         = $param;
                    $checkId[]          = $row->PatientId;
                }

                $detail                 = array();
                $detail['id']           = $row->progressId;
                $detail['month']        = $row->Month;
                $detail['date']         = date('d F Y', strtotime($row->Year.'-'.$row->Month.'-'.$row->Tgl));
                $detail['complication'] = $complication[$row->Complication > 0 ? $row->Complication - 1 : 0];
                $detail['progress']     = $row->Progress;
                $detail['status']       = $row->Status;
                $listProgress[$row->PatientId][]    = $detail;
            }

            foreach ($tempData as $row) {
                $row['progress']    = $listProgress[$row['id']];
                $responseData[]     = $row;
            }

            $response['status']     = '1';
            $response['message']    = 'Data telah ditemukan !';
            $response['data']       = $responseData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
        }

        $this->response($response);
    }
}
?>