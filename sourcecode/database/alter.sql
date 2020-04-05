alter table borrow add adjourn SMALLINT;

drop table system_param;
CREATE TABLE system_param (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(100),
    name NVARCHAR(200),
    svalue NVARCHAR(200)
);

INSERT INTO system_param VALUES (17,'SO_SACH_MUON','Số sách được mượn','5'),(18,'SO_LAN_GIA_HAN','Số lần gia hạn','3'),(19,'SO_NGAY_MUON','Số ngày được mượn lần đầu','14'),(20,'SO_NGAY_GIA_HAN','Số ngày được gia hạn','7');