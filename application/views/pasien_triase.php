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
                            1. Prioritas Pertama (I, tertinggi)
                        </a>
                    </h5>
                </div>
                <div id='collapse-13' class='collapse'  data-parent='#accordion' style=''>
                    <div class='card-body'>
                        Mengancam Jiwa <br>
                        Pemindahan	: Segera <br>
                        <i>Deceased and Immediate</i> <br> <br>
                        <b>Prioritas I	: <span style="background-color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  Merah</b>
                        <ul>
                            <li>Sumbatan jalan nafas atau distress nafas/li>
                            <li>Luka tusuk dada</li>
                            <li>Shock</li>
                            <li>Perdarahan pembuluh nadi</li>
                            <li>Problem kejiwaan serius</li>
                            <li>Tangan/kaki yang terpotong dengan perdarahan</li>
                            <li>Luka bakar yang luas dan berat</li>
                        </ul>
                        <b>Prioritas II	: <span style="background-color: yellow;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  Kuning</b>
                        <ul>
                            <li>Luka bakar sedang dan tidak begitu luas</li>
                            <li>Patah tulang besar</li>
                            <li>Trauma dada/perut</li>
                            <li>Luka robek yang luas</li>
                            <li>Trauma bola mata</li>
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
                            2. Prioritas Kedua
                        </a>
                    </h5>
                </div>
                <div id='collapse-14' class='collapse' data-parent='#accordion' style=''>
                    <div class='card-body'>
                        Potensial Mengancam Jiwa <br>
                        Pemindahan	: Jangan terlambat <br>
                        <i>Delayed</i> <br> <br>
                        <b>Prioritas III : <span style="background-color: green;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  Hijau</b>
                        <ul>
                            <li>Luka memar dan luka robek  otot ringan</li>
                            <li>Luka bakar ringan (kecuali daerah muka dan tangan)</li>
                        </ul>
                    </div>
                </div>
                <div class='card-header'>
                    <h5 class='accordion-menu'>
                        <a
                            role='button'
                            data-toggle='collapse'
                            href='#collapse-15'
                            aria-expanded='false'
                            aria-controls='collapse-15'
                            class='collapsed'
                            style='text-decoration: none'>
                            3. Priortias Ketiga
                        </a>
                    </h5>
                </div>
                <div id='collapse-15' class='collapse' data-parent='#accordion' style=''>
                    <div class='card-body'>
                        Tidak perlu segera <br>
                        Pemindahan	: Paling terakhir <br>
                        <i>Minor</i> <br> <br>
                        <b>Prioritas IV	: <span style="background-color: black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>  Hitam</b>
                        <ul>
                            <li>Henti jantung kritis</li>
                            <li>Trauma kepala kritis</li>
                            <li>Radiasi tinggi</li>
                        </ul>
                        <b>Normal</b>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>