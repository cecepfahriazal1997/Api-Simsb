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
        $data           = array();
        $temp           = array();

        if ($type == 'gejalaSpesifik') {
            $data           = array('Luka', 'Oedema', 'Woud', 'Disorientasi');
        } elseif ($type == 'hubunganKeluarga') {
            $data           = array('Grand Daug', 'Father', 'Mother', 'Son', 'Daughter', 'Grad Father', 
                                    'Grand Mother', 'Son', 'Grand Daughter');
        } else if ($type == 'radiologi') {
            $data           = array('Frackture Tibia 1/3 Upper', 'Frackture Tibia 1/3 Middle', 'Frackture Tibia 1/3 Upper',
                                    'Frackture Tibia 1/3 Lower', 'Frackture Tibia 1/3 Femur', 'Frackture Collum Femur', 
                                    'Frackture Femur 1/3 Lower', 'Frackture Hummery 1/3 Middle', 'Frackture Lumbal L2-3',
                                    'Frackture Patela', 'Dislocation Of Enkle', 'Non');
        } else if ($type == 'diagnosis') {
            $data           = array('Stress', 'Costusio Cerebry', 'Dislocation  Of Enkle', 'Frackture Femur 1/3 Lower', 
                                    'Frackture Humery 1/3 Midlle', 'Frackture Patela', 'Frackture Tibia 1/3 Lower', 
                                    'Frackture Tibia 1/3 Upper', 'Open Frackture Collom Femur', 'Open Frackture Tibia 1/3 Middle',
                                    'Paraplegia', 'Trauma Thorax');
        } else if ($type == 'terapi') {
            $data           = array('Perban', 'Obat', 'Operasi', 'Opertio', 'Fisioterapi', 'Penggantian', 'Invactive Minimum', 'Pemulihan Fisik');
        } else if ($type == 'rehabilitas') {
            $data           = array('Fisioterapi', 'Terapi Occupational', 'Terapi Sosial');
        } else if ($type == 'komplikasi') {
            $data           = array('Infeksi', 'Patah Tulang', 'Cacat', 'Stress Psikologi Pasca Bencana');
        }

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
}
?>