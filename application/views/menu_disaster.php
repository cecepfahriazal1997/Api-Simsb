<html>

<head>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>

<body>
    <div class="container-fluid pt-3">
        <h1 align="center" class="m-3">Klasifikasi Disaster / Bencana</h1>
        <br>
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <a href="<?= base_url().'welcome/naturalDisaster'?>">
                    <div class="card">
                        <img class="card-img-top" src="http://atp-sb-medis.com/image/menu-1.png" style="height: 400px;" alt="Card image cap">
                        <div class="card-body d-none">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4">
                <a href="<?= base_url().'welcome/technologyDisaster'?>">
                    <div class="card">
                        <img class="card-img-top" src="http://atp-sb-medis.com/image/menu-2.png" style="height: 400px;" alt="Card image cap">
                        <div class="card-body d-none">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4">
                <a href="<?= base_url().'welcome/complexDisaster'?>">
                    <div class="card">
                        <img class="card-img-top" src="http://atp-sb-medis.com/image/menu-3.png" style="height: 400px;" alt="Card image cap">
                        <div class="card-body d-none">
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>
</html>