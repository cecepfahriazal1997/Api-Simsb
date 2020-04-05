<?php
defined('BASEPATH') or exit('No direct script access allowed');
class PatientModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function getPatient() {
        $this->db->select('geninfo.*, countries.name as nameCountries', false);
        $this->db->order_by('Time', 'DESC');
        $this->db->join('countries', 'countries.iso1_code = geninfo.Location', 'left');
        $list   = $this->db->get('geninfo')->result();
        return $list;
    }

    public function getPatientById($id) {
        $this->db->where('PatientId', $id);
        return $this->db->get('geninfo')->row();
    }

    public function getHistoryById($id) {
        $this->db->where('PatientId', $id);
        return $this->db->get('history')->row();
    }
    
    public function checkProgress() {
        $this->db->where('PatientId', $id);
        return $this->db->get('progress')->num_rows();
    }

    public function insertData($data) {
        return $this->db->insert('geninfo', $data);
    }

    public function updateData($id, $data) {
        if (!empty($id)) {
            $this->db->where('PatientId', $id);
            return $this->db->update('geninfo', $data);
        } else {
            return false;
        }
    }

    public function deleteData($id) {
        if (!empty($id)) {
            $this->db->where('PatientId', $id);
            return $this->db->delete('geninfo');
        } else {
            return false;
        }
    }

    public function insertDataHistory($data) {
        return $this->db->insert('history', $data);
    }

    public function updateDataHistory($id, $data) {
        if (!empty($id)) {
            $this->db->where('PatientId', $id);
            return $this->db->update('history', $data);
        } else {
            return false;
        }
    }
}
?>