<?php
defined('BASEPATH') or exit('No direct script access allowed');
class ReportModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function getReportPatient() {
        $this->db->select(' geninfo.PatientId,
                            geninfo.PatientNm,
                            geninfo.DoctorNm,
                            geninfo.NurseNm,
                            progress.id_prog as progressId,
                            progress.`Year`,
                            progress.`Month`,
                            progress.`Week`,
                            progress.Tgl,
                            Progress.Complication,
                            progress.Progress,
                            progress.`Status`,
                            progress.Remark', false);
        $this->db->join('progress', 'progress.PatientId = geninfo.PatientId', 'inner');
        $this->db->order_by('geninfo.PatientId', 'ASC');
        $this->db->order_by('progress.Year', 'ASC');
        $this->db->order_by('progress.Month', 'ASC');
        $this->db->order_by('progress.Tgl', 'ASC');
        return $this->db->get('geninfo')->result();
    }
}
?>