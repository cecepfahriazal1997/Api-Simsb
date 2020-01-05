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
                            "
                            <html>
                                <head>
                                    <link
                                        rel='stylesheet'
                                        href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
                                    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
                                    <script
                                        src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
                                    <link
                                        rel='stylesheet'
                                        href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
                                    <style>
                                        .accordion-menu > a {
                                            display: block;
                                            position: relative;
                                            margin-top: 8px;
                                            font-size: 12pt;
                                        }

                                        .accordion-menu > a:after {
                                            content: '\f078';
                                            font-family: 'FontAwesome';
                                            position: absolute;
                                            right: 0;
                                        }

                                        .accordion-menu > a[aria-expanded='true']:after {
                                            content: '\f077';
                                        }

                                        a {
                                            text-decoration: none !important;
                                        }
                                    </style>
                                </head>
                                <body>
                                    <div id='accordion'>
                                        <div class='card'>
                                            <div class='card-header'>
                                                <h5 class='accordion-menu'>
                                                    <a
                                                        role='button'
                                                        data-toggle='collapse'
                                                        href='#collapse-13'
                                                        aria-expanded='false'
                                                        aria-controls='collapse-13'
                                                        class='collapsed'
                                                        style='text-decoration: none'>
                                                        1. Pemeriksaan Primer
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id='collapse-13' data-parent='#accordion' style=''>
                                                <div class='card-body'>
                                                    Pemeriksaan primer adalah deteksi cepat dan koreksi segera terhadap kondisi yang
                                                    mengancam jiwa.
                                                    <br>
                                                    <b>Cara Pelaksanaannya :</b>
                                                    <ul>
                                                        <li>
                                                            Jalan Nafas
                                                            <br>
                                                            Lihat, dengar Raba
                                                            <br>
                                                            Atasi segera, bebaskan jalan nafas
                                                            <br>
                                                            Penghisapan
                                                        </li>
                                                        <li>
                                                            Pernafasan
                                                            <br>
                                                            Apakah pertukaran hawa panas adekuat?
                                                            <br>
                                                            a. Tidak ada, lakukan bantuan nafas
                                                            <br>
                                                            b. Frekuansi
                                                            <br>
                                                            c. Kualitas
                                                            <br>
                                                            d. Teratur
                                                            <br>
                                                            e. Ujung kuku biru atau tidak
                                                        </li>
                                                        <li>Perdarahan
                                                            <br>
                                                            - Diluar :
                                                            <br>
                                                            Hentikan segera :
                                                            <br>
                                                            <ul>
                                                                <li>Dengan bebat tekan pada luka</li>
                                                                <li>Bagian luka yang ditinggikan</li>
                                                                <li>Kompress es</li>
                                                                <li>Tourniquet (hanya pada luka khusus)</li>
                                                            </ul>
                                                            <br>
                                                            - Didalam :
                                                            <ul>
                                                                <li>Kirim segera</li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            Tulang Belakang
                                                            <br>
                                                            Apakah sadar?
                                                            <br>
                                                            Adakah trauma kepala?
                                                            <br>
                                                            Stabilisasi leher dan tulang belakang
                                                            <br>
                                                            Sebelum dikirim
                                                            <br>
                                                        </li>
                                                        <li>
                                                            Shock
                                                            <br>
                                                            Tanda-tanda shock
                                                            <br>
                                                            Stabilitas segera kirim
                                                            <br>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class='card-header'>
                                                <h5 class='accordion-menu'>
                                                    <a
                                                        role='button'
                                                        data-toggle='collapse'
                                                        href='#collapse-14'
                                                        aria-expanded='false'
                                                        aria-controls='collapse-14'
                                                        class='collapsed'
                                                        style='text-decoration: none'>
                                                        2. Pemeriksaan Sekunder
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id='collapse-14' class='collapse' data-parent='#accordion' style=''>
                                                <div class='card-body'>
                                                    Pemeriksaan sekunder adalah mencari perubahan-perubahan yang dapat berkembang
                                                    menjadi lebih gawat dan dapat mengancamjiwa apabila tidak segera diatasi.
                                                    <br>
                                                    <b>Cara Pelaksanaannya :</b>
                                                    <ul>
                                                        <li>
                                                            Periksa kondisi menyeluruh 1. Posisi saat ditemukan 2. Tingkat kesadaran 3.
                                                            Sikap umum dan keluhan 4. Ruda paksa, kelainan 5. Keadaan sulit
                                                        </li>
                                                        <li>
                                                            Periksa kepala dan leher
                                                            <br>
                                                            Rambut, kulit kepala, telinga, mata, hidung, mulut, ada kejang otot leher/tidak
                                                        </li>
                                                        <li>
                                                            Periksa dada dan perut
                                                            <br>
                                                            Ada luka di dada, kelainan bentuk, perut tegang
                                                        </li>
                                                        <li>
                                                            Periksa anggota gerak atas dan bawah
                                                            <br>
                                                            Luka, bengkak, nyeri untuk gerak
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </body>
                            </html>
                            "
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