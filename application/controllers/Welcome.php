<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}

	public function naturalDisaster() {
		$this->load->view('natural_disaster');
	}

	public function technologyDisaster() {
		$this->load->view('technology_disaster');
	}

	public function complexDisaster() {
		$this->load->view('complex_disaster');
	}

	public function pasienTerapi() {
		$this->load->view('pasien_terapi');
	}

	public function pasienPrioritas() {
		$this->load->view('pasien_prioritas');
	}

	public function pasienTriase() {
		$this->load->view('pasien_triase');
	}
}
