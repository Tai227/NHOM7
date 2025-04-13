CREATE DATABASE CinemaDB;
USE CinemaDB;

CREATE TABLE chi_nhanh (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    dia_chi VARCHAR(255),
    duong_dan_anh VARCHAR(1000),
    ten VARCHAR(255),
    so_dien_thoai VARCHAR(255)
);

CREATE TABLE phong (
    id INT PRIMARY KEY AUTO_INCREMENT,
    suc_chua INT,
    duong_dan_anh VARCHAR(1000),
    ten VARCHAR(255),
    tong_dien_tich DOUBLE,
    chi_nhanh_id INT,
    FOREIGN KEY (chi_nhanh_id) REFERENCES chi_nhanh(id)
);

CREATE TABLE ghe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255),
    loai_ghe INT,
    phong_id INT,
    FOREIGN KEY (phong_id) REFERENCES phong(id)
);

CREATE TABLE phim (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_tao VARCHAR(255),
    nguoi_cap_nhat VARCHAR(255),
    dien_vien VARCHAR(255),
    the_loai VARCHAR(255),
    dao_dien VARCHAR(255),
    duong_dan_anh VARCHAR(255),
    dang_chieu INT,
    ngon_ngu VARCHAR(100),
    mo_ta_dai VARCHAR(1000),
    danh_gia VARCHAR(255),
    ngay_phat_hanh DATE,
    mo_ta_ngan VARCHAR(500),
    duong_dan_anh_nho VARCHAR(1000),
    trailer VARCHAR(1000)
);

CREATE TABLE lich_chieu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_tao VARCHAR(255),
    nguoi_cap_nhat VARCHAR(255),
    ngay_bat_dau DATE,
    gio_bat_dau TIME,
    chi_nhanh_id INT,
    phim_id INT,
    phong_id INT,
    FOREIGN KEY (chi_nhanh_id) REFERENCES chi_nhanh(id),
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (phong_id) REFERENCES phong(id)
);

CREATE TABLE nguoi_dung (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_tao VARCHAR(255),
    nguoi_cap_nhat VARCHAR(255),
    email VARCHAR(100),
    duong_dan_anh VARCHAR(100),
    ten VARCHAR(255),
    mat_khau VARCHAR(100),
    ten_dang_nhap VARCHAR(15)
);

CREATE TABLE vai_tro (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(60)
);

CREATE TABLE nguoi_dung_vai_tro (
    nguoi_dung_id BIGINT,
    vai_tro_id BIGINT,
    PRIMARY KEY (nguoi_dung_id, vai_tro_id),
    FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(id),
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

CREATE TABLE ve (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_tao VARCHAR(255),
    nguoi_cap_nhat VARCHAR(255),
    duong_dan_anh VARCHAR(255),
    lich_chieu_id INT,
    ghe_id INT,
    FOREIGN KEY (lich_chieu_id) REFERENCES lich_chieu(id),
    FOREIGN KEY (ghe_id) REFERENCES ghe(id)
);

CREATE TABLE hoa_don (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_cap_nhat VARCHAR(255),
    nguoi_dung_id BIGINT,
    FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(id)
);

CREATE TABLE bai_viet (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ngay_tao DATETIME(6),
    ngay_cap_nhat DATETIME(6),
    nguoi_tao VARCHAR(255),
    nguoi_cap_nhat VARCHAR(255),
    tom_tat VARCHAR(255),
    anh_chinh VARCHAR(255),
    trang_thai INT,
    tieu_de VARCHAR(255),
    loai INT
);

CREATE TABLE thanh_toan (
    id int auto_increment primary KEY,
    nguoidung_id BIGINT REFERENCES nguoi_dung(id) ON DELETE CASCADE,
    ve_id INT REFERENCES ve(id) ON DELETE CASCADE,
    soluong DECIMAL(10,2) NOT NULL,
    phuongthucthanhtoan VARCHAR(50) NOT NULL, 
    trangthai VARCHAR(20) DEFAULT 'chua thanh toan',
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tong_gia_ve FLOAT
);
