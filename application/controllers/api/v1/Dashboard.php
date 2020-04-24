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

class Dashboard extends REST_Controller
{
    public function __construct() {
        parent::__construct();
        $this->load->model("v1/DashboardModel", "model");
    }

    public function getPatientCountries_get() {
        $listData   = $this->model->getTotalPatientCountries();
        $tempData   = array();
        $response   = array();

        if (count($listData) > 0) {
            foreach ($listData as $row) {
                $tempData[] = $row;
            }
            $response['status']     = '1';
            $response['message']    = '';
            $response['data']       = $tempData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
            $response['data']       = $tempData;
        }

        $this->response($response);
    }

    public function getNews_get() {
        $listData   = $this->model->getNews();
        $tempData   = array();
        $response   = array();

        if (count($listData) > 0) {
            foreach ($listData as $row) {
                $tempData[] = $row;
            }
            $response['status']     = '1';
            $response['message']    = '';
            $response['data']       = $tempData;
        } else {
            $response['status']     = '0';
            $response['message']    = 'Data tidak ditemukan !';
            $response['data']       = $tempData;
        }
        $this->response($response);
    }

    public function listUserGuide_get() {
        $title          = array('Petunjuk Pemakaian / User Guide', 'Diagram Alir / Flowchart', 'Petunjuk Penggunaan Versi Mobile', '1. Cara Login', 
                                '2. Cara Merubah Password', '3. Cara Menambahkan Pasien Baru', '4. Cara Merubah Data Pasien', '5. Cara Menambahkan History',
                                '6. Cara Menambah Perkembangan Pasien', '7. Cara Memonitoring Pasien', '8. Cara Kolaborasi', '9. Cara Melihat Laporan', '10. Cara Membuat Asesmen Kebutuhan',
                                '11. Cara Melihat Panduan Saat Bencana');
        $description    = array('Petunjuk pemakaian dalam Sistem Informasi Medis Bencana, mencakup dari memasukkan data, mengedit data, serta menghapus data.',
                            'Bagan atau diagram alir dari Sistem Informasi Medis Bencana', 'Petunjuk penggunaan dalam Sistem Informasi Medis Bencana versi mobile mencakup dan memasukkan data, mengedit data, serta menghapus data.',
                            'Berikut ini adalah video tatacara untuk melakukan login ke dalam Aplikasi.', 'Berikut ini adalah video tatacara melakukan perubahan password lama dengan yang baru.', 
                            'Berikut ini adalah video tatacara untuk menambahkan data pasien baru kedalam aplikasi.', 'Berikut ini adalah video tatacara untuk merubah data pasien yang telah ditambahkan kedalam aplikasi.', 
                            'Berikut ini adalah video tatacara untuk menambahkan data history pasien.', 'Berikut ini adalah video tatacara untuk menambahkan data perkembangan pasien.', 
                            'Berikut ini adalah video tatacara untuk menambahkan data perkembangan pasien.', 'Berikut ini adalah video tatacara untuk menambahkan data monitoring kepada pasien.', 
                            'Berikut ini adalah video tatacara untuk melihat data-data laporan pasien (perkembangan pasien secara berkala)', 'Berikut ini adalah video tatacara untuk membuat asesmen kebutuhan.', 
                            'Berikut ini adalah video tatacara untuk melihat daftar panduan saat bencana.');
        $file           = array('SIMPB_manual.doc', 'FlowChartSIMPB.doc', 'SIMPB_manual_mobile.docx',
                                '01%20Cara%20Login.mp4', '02%20Cara%20Merubah%20Password.mp4', '03%20Cara%20Menambahkan%20Pasien%20Baru.mp4', '04%20Cara%20mMerubah%20Data%20Pasien.mp4',
                                '05%20Cara%20Menambahkan%20History.mp4', '06%20Cara%20Menambah%20Perkembangan%20Pasien.mp4', '07%20Cara%20Memonitoring%20Pasien.mp4', '08%20Cara%20Kolaborasi.mp4', 
                                '09%20Cara%20Melihat%20Laporan.mp4', '10%20Cara%20Membuat%20Asesmen%20Kebutuhan.mp4', '11%20Cara%20Melihat%20Panduan%20Saat%20Bencana.mp4');
        $type           = array('doc', 'doc', 'doc', 'video', 'video', 'video', 'video', 'video', 'video', 'video', 'video', 'video', 'video', 'video');
        $pathFile       = 'http://atp-sb-medis.com/download/';
        $tempData       = array();

        for ($i = 0; $i < count($title); $i++) {
            $param                  = array();
            $param['title']         = $title[$i];
            $param['description']   = $description[$i];
            $param['type']          = $type[$i];
            $param['file']          = $pathFile.''.$file[$i];
            $tempData[]             = $param;
        }

        $response['status']     = '1';
        $response['message']    = '';
        $response['data']       = $tempData;
        $this->response($response);
    }

    public function contactUs_get() {
        $title          = array('Telepon', 'Email', 'Fax');
        $value          = array('021-8906411 Ext 1222', 'info@simb.co.id', '021-8906411');
        $tempData       = array();

        for ($i = 0; $i < count($title); $i++) {
            $param          = array();
            $param['title'] = $title[$i];
            $param['velue'] = $value[$i];
            $tempData[]     = $param;
        }
        $response['status']     = '1';
        $response['message']    = '';
        $response['data']       = $tempData;
        $this->response($response);
    }

    public function prepareDisaster_get() {
        $title          = array(
                            'Saat Bencana',
                            'Sistem Rujukan',
                            'Klasifikasi Bencana',
                            'Pasien Triase',
                            'Pasien Prioritas',
                            'Pasien Transportasi',
                            'Pasien Terapi',
                        );
        $image          = array(
                            "<img style='display: inline;height: auto;max-width: 100%;' src='http://atp-sb-medis.com/image/informasi_1.jpg'/><p>Sumber : <a href='https://www.slideshare.net/antogesek/bencana-dan-triage' style='text-decoration: underline'>https://www.slideshare.net/antogesek/bencana-dan-triage</a>, 2019-12-14, 21.45</p>",
                            "<img style='display: inline;height: auto;max-width: 100%;' src='http://atp-sb-medis.com/image/informasi_2.jpg'/><p>Sumber : <a href='https://www.slideshare.net/antogesek/bencana-dan-triage' style='text-decoration: underline'>https://www.slideshare.net/antogesek/bencana-dan-triage</a>, 2019-12-14, 21.45</p>",
                            '',
                            base_url().'welcome/pasienTriase',
                            base_url().'welcome/pasienPrioritas',
                            "<img style='display: inline;height: auto;max-width: 100%;' src='http://atp-sb-medis.com/image/informasi_5_1.jpg'/><br><br><img style='display: inline;height: auto;max-width: 100%;' src='http://atp-sb-medis.com/image/informasi_5_2.jpg'/><p>Sumber : <a href='https://www.slideshare.net/antogesek/bencana-dan-triage' style='text-decoration: underline'>https://www.slideshare.net/antogesek/bencana-dan-triage</a>, 2019-12-14, 21.45</p>",
                            base_url().'welcome/pasienTerapi'
                        );
        $type           = array(
                            'text',
                            'text',
                            'url',
                            'url',
                            'url',
                            'text',
                            'url'
                        );
        $tempData       = array();

        for ($i = 0; $i < count($title); $i++) {
            $param          = array();
            $param['title'] = $title[$i];
            $param['image'] = $image[$i];
            $param['type']  = $type[$i];
            $tempData[]     = $param;
        }
        $response['status']     = '1';
        $response['message']    = '';
        $response['data']       = $tempData;
        $this->response($response);
    }
}
?>