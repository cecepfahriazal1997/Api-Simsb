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
                            "<html lang='en'>
                            <head>
                                <meta charset='utf-8'>
                                <meta http-equiv='X-UA-Compatible' content='IE=edge'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <link
                                    rel='stylesheet'
                                    href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
                                <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
                                <script
                                    src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
                                <style type='text/css'>
                                    .bs-example {
                                        margin: 20px;
                                    }
                                </style>
                            </head>
                            <body>
                                <div class='bs-example'>
                                    <div class='panel-group' id='accordion'>
                                        <div class='panel panel-default'>
                                            <div class='panel-heading'>
                                                <a
                                                    style='text-decoration:none'
                                                    data-toggle='collapse'
                                                    data-parent='#accordion'
                                                    href='#collapseOne'>
                                                    <h4 class='panel-title'>
                                                        1. What is HTML?
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id='collapseOne' class='panel-collapse collapse in'>
                                                <div class='panel-body'>
                                                    <p>HTML stands for HyperText Markup Language. HTML is the standard markup
                                                        language for describing the structure of web pages.
                                                        <a href='https://www.tutorialrepublic.com/html-tutorial/' target='_blank'>Learn more.</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='panel panel-default'>
                                            <div class='panel-heading'>
                                                <a
                                                    style='text-decoration:none'
                                                    data-toggle='collapse'
                                                    data-parent='#accordion'
                                                    href='#collapseTwo'>
                                                    <h4 class='panel-title'>
                                                        1. What is HTML?
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id='collapseTwo' class='panel-collapse collapse'>
                                                <div class='panel-body'>
                                                    <p>Bootstrap is a sleek, intuitive, and powerful front-end framework for faster
                                                        and easier web development. It is a collection of CSS and HTML conventions.
                                                        <a
                                                            href='https://www.tutorialrepublic.com/twitter-bootstrap-tutorial/'
                                                            target='_blank'>Learn more.</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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