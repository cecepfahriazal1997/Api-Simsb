<?php
defined('BASEPATH') or exit('No direct script access allowed');
class MonitoringPatientModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }
    
    public function listMonitoring($patientId) {
        $this->db->select(' geninfo.PatientId,
                            geninfo.PatientNm,
                            geninfo.Sex,
                            geninfo.Age,
                            geninfo.DoctorNm,
                            geninfo.NurseNm,
                            geninfo.SupportNm,
                            geninfo.Time,
                            monitoring.id,
                            monitoring.Year,
                            monitoring.Month,
                            monitoring.Week,
                            monitoring.Tgl,
                            monitoring.Fact,
                            monitoring.Problem', false);
        if (!empty($patientId)) {
            $this->db->where('monitoring.PatientId', $patientId);
        }
        $this->db->join('monitoring', 'monitoring.PatientId = geninfo.PatientId', 'left');
        $this->db->order_by('geninfo.PatientNm', 'ASC');
        return $this->db->get('geninfo')->result();
    }

    public function insertData($data) {
        return $this->db->insert('monitoring', $data);
    }

    public function updateData($id, $data) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->update('monitoring', $data);
        } else {
            return false;
        }
    }

    public function deleteData($id) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->delete('monitoring');
        } else {
            return false;
        }
    }
}
?>