<?php
defined('BASEPATH') or exit('No direct script access allowed');
class MasterModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function masterStatic($type) {
        $data       = array();
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

        return $data;
    }

    public function getCountries() {
        $this->db->select('iso1_code as id, name', false);
        $this->db->order_by('name', 'ASC');
        return $this->db->get('countries')->result();
    }
}
?>