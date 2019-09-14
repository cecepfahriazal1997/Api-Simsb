<?php
defined('BASEPATH') or exit('No direct script access allowed');
class PatientModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function getPatient() {
        $this->db->order_by('Time', 'DESC');
        $list   = $this->db->get('geninfo')->result();
        return $list;
    }

    public function getPatientById($id) {
        $this->db->where('PatientId', $id);
        return $this->db->get('geninfo')->row();
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

    public function getCountries() {
        $this->db->order_by('name', 'ASC');
        return $this->db->get('countries')->result();
    }
}
?>