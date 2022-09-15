/* ======================== MINI PROJECT MEMBUAT QUERY SQL ======================== */

/* Data yang digunakan adalah data usaha kecil menengah (UKM) tahun 2020
	di Kecamatan Batununggal, Kota Bandung */
/* Sumber data telah dimodifikasi dan diperoleh dari data.bandung.go.id */
/* 15 September 2022 */





/* #1 Tampilkan tabel data UKM lengkap dengan alamat */

DROP PROCEDURE IF EXIST datalengkap()

DELIMITER //

CREATE PROCEDURE datalengkap()
BEGIN
	SELECT a.kode_kecamatan, a.kecamatan, a.kode_kelurahan, a.kelurahan, a.nama_perusahaan, a.alamat_usaha, p.jenis_usaha, p.jumlah_pekerja
		FROM profilukm p
		INNER JOIN alamatukm a
		ON a.nama_perusahaan = p.nama_perusahaan
		ORDER BY a.nama_perusahaan ASC;
END //

DELIMITER ;

CALL datalengkap()


/* #2 Sortir tabel alamat usaha berdasarkan kelurahan scr alfabetik dengan judul kolom kapital */

DELIMITER //

CREATE PROCEDURE tabelalamatukm()
BEGIN
	SELECT a.kelurahan AS 'Kode Kecamatan',
			a.kecamatan AS 'Kecamatan',
			a.kode_kelurahan AS 'Kode Kelurahan',
            a.nama_perusahaan AS 'Nama Perusahaan',
            a.alamat_usaha AS 'Alamat Usaha'
		FROM alamatukm a
        ORDER BY KELURAHAN, nama_perusahaan;
END //

DELIMITER ;

CALL tabelalamatukm()


/* #3 Tampilkan usaha yang berlokasi di Jl Kiaracondong, Jl Binong, dan Jl Jakarta */

DELIMITER //

CREATE PROCEDURE ukmdikbj()
BEGIN
	SELECT a.kelurahan AS 'Kelurahan',
			a.kecamatan AS 'Kecamatan',
			a.kode_kelurahan AS 'Kode Kelurahan',
            a.nama_perusahaan AS 'Nama Perusahaan',
            a.alamat_usaha AS 'Alamat Usaha'
		FROM alamatukm a
        WHERE a.alamat_usaha LIKE '%kiaracondong%' OR
				a.alamat_usaha LIKE '%binong%' OR
                a.alamat_usaha LIKE '%jakarta%'
        ORDER BY a.alamat_usaha, nama_perusahaan;
END //

DELIMITER ;

CALL ukmdikbj()


/* #4 Tampilkan usaha yang memiliki jumlah pegawai lebih atau sama dengan 10 */

DELIMITER //

CREATE PROCEDURE jumlahpegawai()
BEGIN
	SELECT p.nama_perusahaan AS 'Nama Perusahaan',
			p.jenis_usaha AS 'Jenis Perusahaan',
            p.jumlah_pekerja AS 'Jumlah Pekerja'
		FROM profilukm p
        WHERE p.jumlah_pekerja >= 10
        ORDER BY p.jumlah_pekerja DESC;
END //

DELIMITER ;

CALL jumlahpegawai()


/* #5 Hapus data profil UKM yang tidak lengkap */

DELIMITER //

CREATE PROCEDURE hapusprofil()
BEGIN
	DELETE FROM profilukm p 
		WHERE p.nama_perusahaan = 0 OR 
				p.jenis_perusahaan = 0 OR
				p.jumlah_pekerja = 0
		ORDER BY nama_perusahan ASC;
	
END //

DELIMITER ;

-- CALL hapusprofil()

/* ======================== MINI PROJECT MEMBUAT QUERY SQL ======================== */