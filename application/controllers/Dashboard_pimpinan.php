<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_pimpinan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
			
		if($this->session->userdata('login_pimpinan')!=true){
			redirect(base_url('index.php/login_pimpinan'),'refresh');
		}

	}

	public function index()
	{
		$data['konten']="v_dashboard_pimpinan";
		$this->load->view('template_pimpinan',$data);
	}

}

/* End of file Dashboard_pimpinan.php */
/* Location: ./application/controllers/Dashboard_pimpinan.php */