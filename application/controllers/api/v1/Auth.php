<?php
defined('BASEPATH') or exit('No direct script access allowed');
require(APPPATH.'/libraries/REST_Controller.php');

/**
 * @author     Cecep Rokani | cecepfahriazal1997@gmail.com
 * @copyright  2019 Cecep Rokani
 * @version    Auth API 1.0
 * 
 *  =========================================================================
 *  Ketika code akan dirubah, silahkan ubah @version . contoh :
 *  Sebelum diubah -> Auth API 1.0
 *  Setelah diubah -> Auth API 1.1 (Fixing flow login) - Edited by : John Doe
 *  ==========================================================================
 */

class Auth extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/AuthModel", "model");
    }

    public function login_post() {
        $username = $this->post("username");
        $password = $this->post("password");

        $member = $this->model->login($username);
        
        if(!empty($member->id_login)) {
            if (md5(md5($password)) == $member->password) {
                $data['status']             = true;
                $data['message']            = "Login berhasil";

                $tempData['id']     		= $member->id_login;
                $tempData['name']    		= $member->nama;
                $tempData['email']          = $member->email;
                $tempData['phone']    		= (String) $member->telepon;
                $tempData['image']          = 'http://atp-sb-medis.com/image/'.$member->foto;

                $update                     = array();
                $update["jam_login"]        = date("H:i:s");
                $update["tgl_login"]        = date("d-m-Y");
                $update["aktif_log"]        = "1";
                $this->model->updateData(array("id_login" => $member->id_login), "admin", $update);

                $temp[]                     = $tempData;
                $data['result']             = $temp;
            } else {
                $data['status']     = false;
                $data['message']    = "Password yang dimasukan salah";
                $data['result']       = "";
            }    
        } else {
            $data['status']     = false;
            $data['message']    = "Akun tidak ditemukan";
            $data['result']       = "";
        }

        $this->response($data);
    }

    public function profile_get() {
        $id     = $this->get("id");
        $member = $this->model->getDataById($id);
        
        if(!empty($member->id_login)) {
            $data['status']      = true;
            $data['message']     = "Data ditemukan";
            $data['result']      = $member;
        } else {
            $data['status']     = false;
            $data['message']    = "Profil User tidak ditemukan";
            $data['result']       = "";
        }

        $this->response($data);
    }

    public function register_post() {
        $username           = $this->post("username");
        $password           = $this->post("password");
        $name               = $this->post("name");
        $phone              = $this->post("phone");
        $email              = $this->post("email");

        $insert                 = array();
        $insert["username"]     = $username;
        $insert["password"]     = md5(md5($password));
        $insert["nama"]         = $name;
        $insert["telepon"]      = $phone;
        $insert["email"]        = $email;
        $insert["aktif_user"]   = "1";
        $insert["type_user"]    = "0";
        $insert["jam_login"]    = date("H:i:s");
        $insert["tgl_login"]    = date("d-m-Y");
        $insert["aktif_log"]    = "1";
        $insert["pass_asli"]    = $password;

        $cekUser                = $this->model->login($username);
        $response               = array();
        if (!empty($cekUser->id_login)) {
            $response["status"]     = false;
            $response["message"]    = "Username ".$username." telah terdaftar didalam sistem, silahkan gunakan username lainnya !";
        } else {
            $proses                 = $this->model->insertData("admin", $insert);
            if ($proses) {
                $response["status"]     = true;
                $response["message"]    = "Proses pendaftaran berhasil dilakukan !";
                $response["data"]       = $this->model->login($username);
            } else {
                $response["status"]     = false;
                $response["message"]    = "Proses pendaftaran gagal dilakukan !";
            }
        }

        $this->response($response);
    }

    public function changePassword_post() {
        $id                 = $this->post("id");
        $password           = $this->post("password");
        $new_password       = $this->post("new_password");
        $retype_password    = $this->post("retype_password");

        $member             = $this->model->getDataById($id);
        
        if(!empty($member->id_login)) {
            if ($member->password == md5(md5($password))) {
                if(empty($new_password) || empty($retype_password)) {
                    $data['status']     = false;
                    $data['message']    = "Silahkan isi password baru";
                    $data['result']       = "";                
                } else {
                    if($new_password == $retype_password) {
                        $insert['password']         = md5(md5($new_password));
                        $insert['pass_asli']        = $new_password;
                        
                        $proses                     = $this->model->updateData(array("id_login" => $id), "admin", $insert);

                        if($proses) {
                            $data['status']     = true;
                            $data['message']    = "Password berhasil diubah!";
                            $data['result']     = "";        
                        } else {
                            $data['status']     = false;
                            $data['message']    = "Password gagal diubah!";
                            $data['result']     = "";        
                        }
                    } else {
                        $data['status']     = false;
                        $data['message']    = "Konfirmasi password yang dimasukan tidak sesuai";
                        $data['result']     = "";
                    }    
                }
            } else {
                $data['status']     = false;
                $data['message']    = "Password lama yang dimasukan salah";
                $data['result']       = "";
            }    
        } else {
            $data['status']     = false;
            $data['message']    = "Anggota tidak ditemukan";
            $data['result']       = "";
        }

        $this->response($data);
    }

    public function logout_post() {
        $id             = $this->post("id");

        $insert                 = array();
        $insert["jam_logout"]   = date("H:i:s");
        $insert["tgl_logout"]   = date("d-m-Y");
        $proses                 = $this->model->updateData(array("id_login" => $id), "admin", $insert);
        $response               = array();

        if ($proses) {
            $response["status"]     = true;
            $response["message"]    = "Anda berhasil logout dari aplikasi !";
        } else {
            $response["status"]     = false;
            $response["message"]    = "Anda gagal logout dari aplikasi !";
        }

        $this->response($response);
    }
}
