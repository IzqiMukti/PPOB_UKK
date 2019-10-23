<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_pimpinan extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('tarif_model','tarif');
	}

	public function index()
	{
		$data['tarif']=$this->tarif->get_tarif();
		$this->load->view('v_login_pimpinan',$data);
	}
	public function proses()
	{
		$this->load->model('login_pimpinan_model','l_pimpinan');
		$login=$this->l_pimpinan->cek_pimpinan();
		if($login->num_rows()>0){
			$dt_pimpinan=$login->row();
			$data_pimpinan = array(
				'id_pimpinan' => $dt_pimpinan->id_pimpinan,
				'nama_pimpinan'=> $dt_pimpinan->nama_pimpinan,
				'username'=> $dt_pimpinan->username,
				'password'=>$dt_pimpinan->password,
				'login_pimpinan'=>true
		
			);
			$this->session->set_userdata( $data_pimpinan );
			redirect(base_url('index.php/dashboard_pimpinan'),'refresh');
		} else {
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger">Username dan password tidak cocok</div>');
			redirect(base_url('index.php/login_pimpinan'),'refresh');
		}
	}
	public function simpan()
	{
		$this->load->model('login_pimpinan_model','l_pimpinan');
		$cek_data=$this->l_pimpinan->tambah_pimpinan();
		if($cek_data){
			$this->session->set_flashdata('pesan', '<div class="alert alert-success">Pendaftaran anda sukses</div>');
			redirect(base_url('index.php/login_pimpinan'),'refresh');
		} else {
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger">Pendaftaran anda gagal</div>');
			redirect(base_url('index.php/login_pimpinan'),'refresh');
		}
	}

}

/* End of file Login_pimpinan.php */
/* Location: ./application/controllers/Login_pimpinan.php */