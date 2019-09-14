<?php
defined('BASEPATH') or exit('No direct script access allowed');
class AuthModel extends CI_Model
{
    public function __construct() {
        parent::__construct();
    }

    public function login($username) {
        $this->db->where("username", $username);
        return $this->db->get("admin")->last_row();
    }

    public function getDataById($id) {
        $this->db->where("id_login", $id);
        return $this->db->get("admin")->row();
    }

    public function insertData($table, $data) {
        return $this->db->insert($table, $data);
    }

    public function updateData($where, $table, $data) {
        if (!empty($where)) {
            $this->db->where($where);
            return $this->db->update($table, $data);
        } else {
            return false;
        }
    }

    public function deleteData($id, $table) {
        if (!empty($id)) {
            $this->db->where("id_login", $id);
            return $this->db->delete($table);
        } else {
            return false;
        }
    }
}
?>