<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ProgressPatientModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }
    
    public function listProgress() {
        $this->db->select(' geninfo.PatientId,
                            geninfo.PatientNm,
                            geninfo.Sex,
                            geninfo.Age,
                            geninfo.DoctorNm,
                            geninfo.NurseNm,
                            geninfo.SupportNm,
                            geninfo.Time,
                            progress.id_prog,
                            progress.Year,
                            progress.Month,
                            progress.Week,
                            progress.Tgl,
                            progress.Complication,
                            progress.ComplicationDtl,
                            progress.Progress,
                            progress.Status,
                            progress.Remark', false);
        $this->db->join('progress', 'progress.PatientId = geninfo.PatientId', 'inner');
        $this->db->order_by('geninfo.PatientNm', 'ASC');
        return $this->db->get('geninfo')->result();
    }

    public function insertData($data) {
        return $this->db->insert('progress', $data);
    }

    public function updateData($id, $data) {
        if (!empty($id)) {
            $this->db->where('id_prog', $id);
            return $this->db->update('progress', $data);
        } else {
            return false;
        }
    }

    public function deleteData($id) {
        if (!empty($id)) {
            $this->db->where('id_prog', $id);
            return $this->db->delete('progress');
        } else {
            return false;
        }
    }
}
?>