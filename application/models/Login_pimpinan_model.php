<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_pimpinan_model extends CI_Model {

	public function cek_pimpinan()
	{
		return $this->db->where('username',$this->input->post('username'))->where('password',$this->input->post('password'))->get('pimpinan');
	}
	public function tambah_user()
	{
		$object=array(
			'nama_pimpinan'=>$this->input->post('nama'),
			'username'=>$this->input->post('username'),
			'password'=>$this->input->post('password')
		
		);
		return $this->db->insert('pimpinan', $object);
	}
}

/* End of file Login_user_model.php */
/* Location: ./application/models/Login_user_model.php */