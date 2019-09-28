<?php
defined('BASEPATH') or exit('No direct script access allowed');
class CollaborationPatientModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }
    
    public function listCollaboration() {
        $this->db->select(' geninfo.PatientId,
                            geninfo.PatientNm,
                            geninfo.Sex,
                            geninfo.Age,
                            geninfo.DoctorNm,
                            geninfo.NurseNm,
                            geninfo.SupportNm,
                            geninfo.Time,
                            collaboration.id,
                            collaboration.Year,
                            collaboration.Month,
                            collaboration.Week,
                            collaboration.Tgl,
                            collaboration.Problem,
                            collaboration.Recommend,
                            collaborationdtl.id as detailId,
                            collaborationdtl.CollaborativeC,
                            collaborationdtl.CollaborativeD,
                            collaborationdtl.Feedback,', false);
        $this->db->join('collaboration', 'collaboration.PatientId = geninfo.PatientId', 'inner');
        $this->db->join('collaborationdtl', 'collaborationdtl.PatientId = collaboration.PatientId', 'inner');
        $this->db->group_by('collaboration.id');
        $this->db->order_by('geninfo.PatientNm', 'ASC');
        return $this->db->get('geninfo')->result();
    }

    public function insertData($table, $data) {
        return $this->db->insert($table, $data);
    }

    public function updateData($table, $id, $data) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->update($table, $data);
        } else {
            return false;
        }
    }

    public function deleteData($table, $id) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->delete($table);
        } else {
            return false;
        }
    }
}
?>