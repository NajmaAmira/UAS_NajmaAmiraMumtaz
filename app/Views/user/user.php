<?= $this->extend('components/layout') ?>
<?= $this->section('content') ?>

<?php if (session()->getFlashData('success')) : ?>
    <div class="alert alert-info alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('success') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<?php if (session()->getFlashData('failed')) : ?>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('failed') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
    Tambah Pengguna
</button>

<!-- Add User Modal -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Tambah Pengguna</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<?= base_url('user/store') ?>" method="post">
                <?= csrf_field(); ?>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="md5" name="password" class="form-control" id="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select name="role" class="form-control" id="role" required>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" name="is_aktif" id="is_aktif" value="1">
                        <label class="form-check-label" for="is_aktif">Aktif</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Table with stripped rows -->
<table class="table datatable">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Role</th>
            <th scope="col">Status</th>
            <th scope="col"></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($users as $index => $user) : ?>
            <tr>
                <th scope="row"><?php echo $index + 1 ?></th>
                <td><?php echo $user['username'] ?></td>
                <td><?php echo $user['role'] ?></td>
                <td><?php echo $user['is_aktif'] ? 'Aktif' : 'Non-Aktif' ?></td>
                <td>
                    <?php if ($user['is_aktif']) : ?>
                        <a href="<?= base_url('user/deactivate/' . $user['id']) ?>" class="btn btn-warning" onclick="return confirm('Nonaktifkan pengguna ini?')">
                            Nonaktifkan
                        </a>
                    <?php else : ?>
                        <a href="<?= base_url('user/activate/' . $user['id']) ?>" class="btn btn-success" onclick="return confirm('Aktifkan pengguna ini?')">
                            Aktifkan
                        </a>                        
                    </a>
                        
                    <?php endif; ?>
                    <a href="<?= base_url('user/edit/' . $user['id']) ?>" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal-<?= $user['id'] ?>">
                        Edit
                    <a></a>
                    <a href="<?= base_url('user/delete/' . $user['id']) ?>" class="btn btn-danger" onclick="return confirm('Hapus pengguna ini?')">
                        Hapus
                    </a>
                </td>
            </tr>
            <!-- Edit Modal Begin -->
<div class="modal fade" id="editModal-<?= $user['id'] ?>" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Data</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="<?= base_url('user/edit/' . $user['id']) ?>" method="post" enctype="multipart/form-data">
                            <?= csrf_field(); ?>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="name">Username</label>
                                    <input type="text" name="username" class="form-control" id="username" value="<?= $user['username'] ?>" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <label for="name">Password</label>
                                    <input type="text" name="password" class="form-control" id="password" value="<?= $user['password'] ?>" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="name">Role</label>
                                    <input type="text" name="role" class="form-control" id="role" value="<?= $user['role'] ?>" placeholder="Role" required>
                                </div>
                                <div class="form-group">
                                    <label for="isi">Status</label><br>
                                    <select id="is_aktif" name="is_aktif" class="btn btn-primary dropdown-toggle">
                                        <option value="1">Aktif</option>
                                        <option value="0">Tidak Aktif</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal End -->
        <?php endforeach ?>
    </tbody>
</table>
<!-- End Table with stripped rows -->
<!-- Add Modal Begin -->
<div class="modal fade" id="addModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<?= base_url('user') ?>" method="post" enctype="multipart/form-data">
                <?= csrf_field(); ?>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Username</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Password</label>
                        <input type="text" name="password" class="form-control" id="password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <label for="name">role</label>
                        <input type="text" name="role" class="form-control" id="role" placeholder="Role" required>
                    </div>
                    <div class="form-group">
                        <label>Status</label><br>
                        <select id="status" name="is_aktif" class="btn btn-primary dropdown-toggle">
                            <option value="1">Aktif</option>
                            <option value="0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ">Tidak Aktif</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?= $this->endSection() ?>