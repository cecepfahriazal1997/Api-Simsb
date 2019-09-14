<?php
defined('BASEPATH') or exit('No direct script access allowed');
class DashboardModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function getTotalPatientCountries() {
        $this->db->select('countries.name, count(geninfo.PatientId) as total', false);
        $this->db->join('countries', 'countries.iso1_code = geninfo.Location', 'inner');
        $this->db->group_by('countries.iso1_code');
        $this->db->order_by('countries.name', 'ASC');
        $list   = $this->db->get('geninfo')->result();
        return $list;
    }

    public function getNews() {
        $this->db->select('id_berita, judul, isi, tgl, sumber', false);
        $this->db->order_by('tgl', 'DESC');
        $list   = $this->db->get('berita')->result();
        return $list;
    }
}
?>