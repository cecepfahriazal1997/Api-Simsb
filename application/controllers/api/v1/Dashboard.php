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
        $title          = array('Petunjuk Pemakaian / User Guide', 'Diagram Alir / Flowchart');
        $description    = array('Petunjuk pemakaian dalam Sistem Informasi Medis Bencana, mencakup dari memasukkan data, mengedit data, serta menghapus data.',
                            'Bagan atau diagram alir dari Sistem Informasi Medis Bencana');
        $file           = array('SIMPB_manual.doc', 'FlowChartSIMPB.doc');
        $pathFile       = 'http://atp-sb-medis.com/download/';
        $tempData       = array();

        for ($i = 0; $i < count($title); $i++) {
            $param                  = array();
            $param['title']         = $title[$i];
            $param['description']   = $description[$i];
            $param['type']          = 'doc';
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
                            "<img src='http://atp-sb-medis.com/image/informasi_1.jpg'/>",
                            "<img src='http://atp-sb-medis.com/image/informasi_2.jpg'/>",
                            "<img src='http://atp-sb-medis.com/image/informasi_3.jpg'/>",
                            "<img src='http://atp-sb-medis.com/image/informasi_4.jpg'/>",
                            "<h4 align='center'>Prioritas Pertama</h4>
                            <ul>
                                <li>Mengancam jiwa/mengancam fungsi vital.</li>
                                <li>Penanganan dan pemindahan bersifat SEGERA</li>
                            </ul>
                            <h4 align='center'>Prioritas Kedua</h4>
                            <ul>
                                <li>Potensial mengancam jiwa/mengancam fungsi vital, bila tidak segera ditangani
                                    dalam waktu
                                </li>
                            </ul>
                            <h4 align='center'>Singkat</h4>
                            <ul>
                                <li>Penanganan dan pemindahan bersifat JANGAN TERLAMBAT</li>
                            </ul>
                            <h4 align='center'>Prioritas Ketiga</h4>
                            <ul>
                                <li>Perlu penanganannya seperti pelayanan biasa</li>
                                <li>Tidak perlu segera</li>
                                <li>Penanganan dan pemindahannya bersifat TERAKHIR</li>
                            </ul>",
                            "<img src='http://atp-sb-medis.com/image/informasi_5_1.jpg'/><br><br><img src='http://atp-sb-medis.com/image/informasi_5_2.jpg'/>",
                            "<html>
                            <head>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <style>
                                    .accordion {
                                        background-color: #eee;
                                        color: #444;
                                        cursor: pointer;
                                        padding: 18px;
                                        width: 100%;
                                        border: none;
                                        text-align: left;
                                        outline: none;
                                        font-size: 15px;
                                        transition: 0.4s;
                                    }
                        
                                    .accordion:hover,
                                    .active {
                                        background-color: #ccc;
                                    }
                        
                                    .panel {
                                        padding: 0 18px;
                                        display: none;
                                        background-color: white;
                                        overflow: hidden;
                                    }
                                </style>
                            </head>
                            <body>
                        
                                <h2>Accordion</h2>
                        
                                <button class='accordion'>Section 1</button>
                                <div class='panel'>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                        
                                <button class='accordion'>Section 2</button>
                                <div class='panel'>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                        
                                <button class='accordion'>Section 3</button>
                                <div class='panel'>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat.</p>
                                </div>
                        
                                <script>
                                    var acc = document.getElementsByClassName('accordion');
                                    var i;
                        
                                    for (i = 0; i < acc.length; i++) {
                                        acc[i].addEventListener('click', function () {
                                            this
                                                .classList
                                                .toggle('active');
                                            var panel = this.nextElementSibling;
                                            if (panel.style.display === 'block') {
                                                panel.style.display = 'none';
                                            } else {
                                                panel.style.display = 'block';
                                            }
                                        });
                                    }
                                </script>
                        
                            </body>
                        </html>"
                        );
        $tempData       = array();

        for ($i = 0; $i < count($title); $i++) {
            $param          = array();
            $param['title'] = $title[$i];
            $param['image'] = $image[$i];
            $tempData[]     = $param;
        }
        $response['status']     = '1';
        $response['message']    = '';
        $response['data']       = $tempData;
        $this->response($response);
    }
}
?>