<div class="block-header">
    <h2>Data Admin</h2>
</div>

<div class="row clearfix">
    <div class="col-md-12">
        <div class="card">
            <div class="body">
                <a href="#tambah" class="btn btn-primary" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span> Tambah</a>                      
                <table class="table table-hover table-striped">
                    <tr>
                        <th>NO</th><th>ID ADMIN</th><th>NAMA ADMIN</th><th>USERNAME</th><th>PASSWORD</th><th>admin</th><th>AKSI</th>
                    </tr>
                   
                    <?php 
                    $no=0;
                    foreach ($data_admin as $dt_admin) {
                        $no++;
                        echo '<tr>
                                <td>'.$no.'</td>
                                <td>'.$dt_admin->id_admin.'</td>
                                <td>'.$dt_admin->nama_admin.'</td>
                                <td>'.$dt_admin->username.'</td>
                                <td>'.$dt_admin->password.'</td>
                                <td>'.$dt_admin->nama_level.'</td>
                                <td><a href="#update_admin" class="btn btn-warning" data-toggle="modal" onclick="tm_detail('.$dt_admin->id_admin.')">Update</a> <a href="'.base_url('index.php/admin/hapus_admin/'.$dt_admin->id_admin).'" onclick="return confirm(\'anda yakin?\')" class="btn btn-danger">Delete</a></td>
                             </tr>';
                    }
                    ?>
                 </table>


                <?php 
                  if($this->session->flashdata('pesan')!=null){
                    echo '<div class="alert alert-danger">'.$this->session->flashdata('pesan').'</div>';
                  }
                ?>
            </div>
        </div>
    </div>
</div>

<script>
  
  function tm_detail(id_admin) {
    $.getJSON("<?=base_url()?>index.php/admin/get_detail_admin/"+id_admin,function(data){
        $("#id_admin").val(data['id_admin']);
        $("#nama_admin").val(data['nama_admin']);
    });
  }

</script>