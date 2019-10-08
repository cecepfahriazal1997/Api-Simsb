<?php
defined('BASEPATH') or exit('No direct script access allowed');
class AssessmentNeedModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function getData($id) {
        $this->db->select(' kebutuhan.*,
                            countries.name as nameLocation', false);
        $this->db->join('countries', 'kebutuhan.location = countries.iso1_code', 'inner');
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->get('kebutuhan')->row();
        } else {
            $this->db->order_by('waktu', 'ASC');
            return $this->db->get('kebutuhan')->result();
        }
    }

    public function insertData($data) {
        return $this->db->insert('kebutuhan', $data);
    }

    public function updateData($id, $data) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->update('kebutuhan', $data);
        } else {
            return false;
        }
    }

    public function deleteData($id) {
        if (!empty($id)) {
            $this->db->where('id', $id);
            return $this->db->delete('kebutuhan');
        } else {
            return false;
        }
    }
}
?>