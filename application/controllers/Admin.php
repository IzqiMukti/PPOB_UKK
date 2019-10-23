<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class admin extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		if($this->session->userdata('login')!=true){
			redirect(base_url('index.php/login'),'refresh');
		}
	}

	public function index()
	{
		$data['konten']="v_admin";
		$this->load->model('admin_model','admin');
		$data['data_admin']=$this->admin->get_admin();
		$this->load->model('level_model','level');
		$data['data_level']=$this->level->get_level();
		$this->load->view('template', $data, FALSE);
	}
	public function simpan_admin()
	{
		$this->form_validation->set_rules('nama_admin', 'Nama admin', 'trim|required',
		array('required' => 'nama admin harus diisi'));
		$this->form_validation->set_rules('username', 'Username', 'trim|required',
		array('required' => 'Username harus diisi'));
		$this->form_validation->set_rules('password', 'Password', 'trim|required',
		array('required' => 'Password harus diisi'));
		$this->form_validation->set_rules('id_level', 'Nama Level', 'trim|required',
		array('required' => 'Nama level harus diisi'));


		if ($this->form_validation->run() == TRUE) {
			$this->load->model('admin_model','admin');
			$masuk=$this->admin->masuk_db();
			if($masuk==true){
				$this->session->set_flashdata('pesan', 'sukses masuk');
			} else {
				//$this->session->set_flashdata('pesan', 'gagal masuk');
			}
			redirect(base_url('index.php/admin'),'refresh');
		} else {
			$this->session->set_flashdata('pesan', validation_errors());
			redirect(base_url('index.php/admin'),'refresh');

		}
	}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */