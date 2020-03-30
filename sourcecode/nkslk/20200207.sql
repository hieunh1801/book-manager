use nkslk;
/*DECLARE @date DATE = getdate()

;WITH N(N)AS 
(SELECT 1 FROM(VALUES(1),(1),(1),(1),(1),(1))M(N)),
tally(N)AS(SELECT ROW_NUMBER()OVER(ORDER BY N.N)FROM N,N a)

SELECT top(day(EOMONTH(@date)))
  N day,
  dateadd(d,N-1, @date) date
FROM tally

select * from nhancong

*/

-- câu 1: Hiển thị NKSLK trong tháng, tuần của 1 nhân viên bất kỳ
-- tạo proc

CREATE PROC [dbo].[s1_nkslk] 
	@macongnhan int,
	@week AS int,
	@month AS int,
	@Year AS int
AS
BEGIN
  

  SELECT gweek as tuan, gdate as ngay, gioBatDau, gioKetThuc
  FROM dbo.weeks_of_month(@year,@month) e
  LEFT JOIN NKSLK b ON e.gdate = b.ngay
  LEFT JOIN NKSLK_ChiTiet a ON a.maNKSLK = b.maNKSLK AND a.maNhanCong = @macongnhan
  WHERE @week is null or gweek = @week

END
-- goi ham
exec s1_nkslk 7,null,11,2018

----------------------
-- câu 2: hiển thị thông tin công việc có nhiều NKSLK nhất

alter proc s2_nkslk
as
begin
	select cv.maCongViec, cv.tenCongViec, cv.dinhMucKhoan, cv.donViKhoan, cv.heSoKhoan, cv.dinhMucLaoDong, cv.donGia, cv.maCongViec  
	from CongViec cv
	where cv.maCongViec in (
		select top 1 with ties maCongViec
		from DanhMucKhoan_ChiTiet 
		group by maCongViec
		order by count(maChiTiet) desc
	)
end

exec s2_nkslk


---------------------
-- câu 3: hiển thị công việc có đơn giá cao nhất, nhỏ nhất

alter proc s3_nkslk_congviec_dongiacao
as
begin
	select  top 1 with ties cv.maCongViec, cv.tenCongViec, cv.dinhMucKhoan, cv.donViKhoan, cv.heSoKhoan, cv.dinhMucLaoDong, cv.donGia, cv.maCongViec  
	from CongViec cv
	order by cv.donGia desc
end;

alter proc s3_nkslk_congviec_dongiathap
as
begin
	select  top 1 with ties cv.maCongViec, cv.tenCongViec, cv.dinhMucKhoan, cv.donViKhoan, cv.heSoKhoan, cv.dinhMucLaoDong, cv.donGia, cv.maCongViec  
	from CongViec cv
	order by cv.donGia asc
end;

exec s3_nkslk_congviec_dongiacao

exec s3_nkslk_congviec_dongiathap

---------------------
-- câu 4: hiển thị công việc có đơn giá lớn hơn, nhỏ hơn đơn giá trung bình của cả danh mục công việc
alter proc s4_nkslk_congviec_dongiacaohon
as
begin
	select cv.maCongViec, cv.tenCongViec, cv.dinhMucKhoan, cv.donViKhoan, cv.heSoKhoan, cv.dinhMucLaoDong, cv.donGia, cv.maCongViec  
	from CongViec cv
	where cv.donGia > (
		select avg(dongia) from CongViec
	)
end

alter proc s4_nkslk_congviec_dongiathaphon
as
begin
	select cv.maCongViec, cv.tenCongViec, cv.dinhMucKhoan, cv.donViKhoan, cv.heSoKhoan, cv.dinhMucLaoDong, cv.donGia, cv.maCongViec  
	from CongViec cv
	where cv.donGia < (
		select avg(dongia) from CongViec
	)
end

exec s4_nkslk_congviec_dongiacaohon
exec s4_nkslk_congviec_dongiathaphon
--------------------
-- câu 5: Hiển thị danh mục sản phẩm có ngày đăng ký trước ngày 15/08/2019
alter proc s5_nkslk 
	@ngay date
as
begin
	select sp.maSanPham, sp.tenSanPham, sp.soDangKy, sp.hanSuDung, sp.quyCach, sp.ngayDangKy
	from SanPham sp
	where sp.ngayDangKy < @ngay
	order by sp.ngayDangKy desc
end
 exec s5_nkslk '2019-08-15'

------------------------
-- câu 6:: Hiển thị danh mục các sản phẩm có hạn sử dụng trên 1 năm từ ngày sản xuất
alter proc s6_nkslk 
as
begin
	select sp.maSanPham, sp.tenSanPham, sp.soDangKy, sp.hanSuDung, sp.quyCach, sp.ngayDangKy
	from SanPham sp
	where DATEDIFF(day,ngayDangKy, hanSuDung ) > 365
	order by sp.ngayDangKy desc
end

exec s6_nkslk
-----------------
-- câu 7: Hiển thị danh mục công nhân được nhóm theo phòng ban, chức vụ
create proc s7_nkslk 
as
begin
	select phongBan, chucVu, maNhanCong, hoTen, ngaySinh,  queQuan, luongBaoHiem, gioiTinh
	from NhanCong 
	order by phongBan asc, chucVu asc
end

exec s7_nkslk
------------------
-- câu 8: Hiển thị danh mục công nhân chuẩn bị về hưu (còn làm việc thêm một năm, 54 đối với nam và 49 đối với nữ).
alter table NhanCong
add gioiTinh tinyint 


alter proc s8_nkslk
as
begin
	select c.maNhanCong, c.hoTen, c.ngaySinh, c.gioiTinh
		, c.queQuan, c.luongBaoHiem, c.phongBan, c.chucVu
		, DATEDIFF(year, ngaySinh, GETDATE() ) as tuoi
	from NhanCong c
	where 
	( gioiTinh=1 and DATEADD(year,54,ngaySinh) between GETDATE() and DATEADD(year,1,GETDATE() ) )
	OR ( gioiTinh=0 and DATEADD(year,49,ngaySinh) between GETDATE() and DATEADD(year,1,GETDATE() ) )
end

exec s8_nkslk
----------------
-- câu 9: Hiển thị danh mục công nhân có độ tuổi từ 30 đến 45.
alter proc s9_nkslk
as
begin
	select c.maNhanCong, c.hoTen, c.ngaySinh, c.gioiTinh
		, c.queQuan, c.luongBaoHiem, c.phongBan, c.chucVu
		, DATEDIFF(year, ngaySinh, GETDATE() ) as tuoi
	from NhanCong c
	where 
	DATEDIFF(year, ngaySinh, GETDATE() )  between 30 and 45
	order by DATEDIFF(year, ngaySinh, GETDATE() ) 
end

exec s9_nkslk
-----------------
-- câu 10: Hiển thị danh mục công nhân có NKSLK được thực hiện ở ca 3
alter proc s10_nkslk
as
begin
	select distinct c.maNhanCong, c.hoTen, c.ngaySinh, c.gioiTinh
		, c.queQuan, c.luongBaoHiem, c.phongBan, c.chucVu
	from NhanCong c
	inner join NKSLK_ChiTiet ct on ct.maNhanCong = c.maNhanCong
	where ( dbo.f_get_time(ct.gioKetThuc,1) > 22  and dbo.f_get_time(ct.gioKetThuc,1) <= 30  )
end

exec s10_nkslk
-----------------
--câu 11: Hiển thị danh mục NKSLK của toàn bộ công nhân trong nhà máy theo tuần, tháng.

alter PROC [dbo].[s11_nkslk] 
	@week AS int,
	@month AS int,
	@Year AS int
AS
BEGIN
  select nc.maNhanCong, nc.hoTen, b.ngay, e.gweek, a.gioBatDau, a.gioKetThuc
	from dbo.weeks_of_month(@year, @month)  e 
	left join NKSLK b on  e.gdate = b.ngay  -- and e.gweek = @week
	 left join  NKSLK_ChiTiet a on a.maNKSLK = b.maNKSLK 
	 right join NhanCong nc on a.maNhanCong = nc.maNhanCong
	 where @week is null or e.gweek = @week
	 order by  b.ngay asc, nc.maNhanCong asc, a.gioBatDau asc

END

exec s11_nkslk null,11,2018

---------------------
-- câu 12: Hiển thị bảng lương sản phẩm của toàn bộ công nhân trong nhà
--		máy, theo tuần, theo tháng ( Lương được tính của 1 công nhân =
--		tổng toàn bộ (sản lượng thực sự làm được * đơn giá của mã công
--		việc đó) nếu công việc đó được làm riêng, còn nếu làm chung thì
--		lương được hưởng của công nhân đó trong công việc chung = tổng
--		toàn bộ (sản lượng thưc sự làm được * đơn giá của mã công việc
--		đó)* thời gian của cá nhân đó làm việc trong nhóm/ tổng thời gian
--		tham gia vào ca của cả nhóm

-- tính lương mỗi ngày

-- declare @maNhanCong int = 7
-- declare @ngay date = '2018-11-03'
-- select [dbo].[f_get_salary_day](20,'2018-11-03')

create FUNCTION [dbo].[f_get_salary_day]
( @maNhanCong int,  @ngay date )
RETURNS float
AS
BEGIN
	declare @tongtien float 
	declare @thoigiancanhan float
	declare @thoigiannhom float
	declare @res float

	select @tongtien= sum(b.sanLuongThucTe*c.donGia)
	from NKSLK a
	inner join DanhMucKhoan_ChiTiet b on a.maNKSLK=b.maNKSLK
	inner join CongViec c on b.maCongViec = c.maCongViec
	where a.ngay = @ngay

	select @thoigiancanhan = sum (dbo.f_get_time(b.gioKetThuc,1)-dbo.f_get_time(b.gioBatDau,0))
	from NKSLK a
	inner join NKSLK_ChiTiet b on a.maNKSLK = b.maNKSLK
	where a.ngay = @ngay and b.maNhanCong = @maNhanCong

	select @thoigiannhom = sum (dbo.f_get_time(b.gioKetThuc,1)-dbo.f_get_time(b.gioBatDau,0))
	from NKSLK a
	inner join NKSLK_ChiTiet b on a.maNKSLK = b.maNKSLK
	where a.ngay = @ngay

	if @thoigiancanhan is null
		set @thoigiancanhan = 0

	if @thoigiannhom is null or @thoigiannhom = 0
		set @res = 0
	else
		set @res = @tongtien*@thoigiancanhan/@thoigiannhom
	return @res
END


----------
 /*
 DECLARE @macongnhan int =20
 DECLARE @month AS INT = 11
 DECLARE @Year AS INT = 2018
 select [dbo].[f_get_salary_month](@macongnhan,@month,@Year)
 */

alter FUNCTION [dbo].[f_get_salary_month]
( @maNhanCong int,  @month int, @year int )
RETURNS float
AS
begin

	DECLARE  @res float
	
	SELECT @res = sum ( dbo.f_get_salary_day(@maNhanCong,gdate))
	from dbo.weeks_of_month(@year,@month)

	return @res
end


alter FUNCTION [dbo].[f_get_salary_week]
( @maNhanCong int,  @week int,  @month int, @year int )
RETURNS float
AS
begin

	DECLARE @res float
	
	SELECT @res = sum ( dbo.f_get_salary_day(@maNhanCong,gdate))
	from dbo.weeks_of_month(@year,@month)
	where gweek=@week

	return @res
end

-- hiểu thị lương theo tháng
select maNhanCong, hoTen, [dbo].[f_get_salary_month](maNhanCong,11,2018) as luong
from NhanCong

-- hiểu thị lương theo tuần
select maNhanCong, hoTen, [dbo].[f_get_salary_week](maNhanCong,2,11,2018) as luong
from NhanCong

-- select * from NKSLK_ChiTiet
----------------- 
/*drop trigger save_NKSLK_ChiTiet
alter trigger save_NKSLK_ChiTiet on NKSLK_ChiTiet for insert, update
as
begin
	declare @gioBatDau time(7), @gioKetThuc time(7), @bd float
			, @kt float, @maNKSLK int, @maNhanCong int
			, @maChiTiet int, @ngay date, @id int
	select @gioBatDau=gioBatDau, @gioKetThuc=gioKetThuc
		,@maNKSLK=maNKSLK,@maNhanCong=maNhanCong
		, @maChiTiet=maChiTiet 
	from inserted

	

	set @bd = dbo.f_get_time(@gioBatDau,0)
	-- set @kt =  dbo.f_get_time(@gioKetThuc,1)
	DECLARE @time float, @hour int, @minute int;

	set @hour = DATEPART(HOUR, @gioKetThuc)
	set @minute = DATEPART(MINUTE, @gioKetThuc)
	if (@hour>=0 and @hour<=6)
	begin
		set @hour = @hour + 24
	end
	if (@hour>=6 and @hour<24)
	begin
		set @hour = @hour + 24
	end
	set  @kt  = @hour + @minute/60.0;

	if @bd<30 and @kt >30
	begin
	-- cap nhat ban ghi cu
		update NKSLK_ChiTiet 
		set gioKetThuc = CONVERT(time, '06:00:00')
		where maChiTiet=@maChiTiet

		select @ngay=ngay from NKSLK where maNKSLK=@maNKSLK
		--print  concat('ngay: ',CONVERT(varchar, @ngay,101))
		--print  concat('hom sau: ',CONVERT(varchar, DATEADD(day, 1, @ngay),101))
		--print  concat('@maNKSLK 0: ',CONVERT(varchar, @maNKSLK)); 
		select @id=maNKSLK from NKSLK where ngay = DATEADD(day, 1, @ngay)
		--print  concat('@maNKSLK 1: ',CONVERT(varchar, @id)); 
		if @id is null
		begin
			insert into NKSLK(ngay) values(DATEADD(day, 1, @ngay))
		end
		select @id=maNKSLK from NKSLK where ngay = DATEADD(day, 1, @ngay)
		--print  concat('@maNKSLK 2: ',CONVERT(varchar, @id)); 
		-- them ban ghi moiw
		insert into NKSLK_ChiTiet(maNKSLK,maNhanCong,gioBatDau,gioKetThuc) 
		values(@id,@maNhanCong, CONVERT(time, '06:00:00'),@gioKetThuc)
	end
end


update NKSLK_ChiTiet 
set gioKetThuc = CONVERT(time, '09:30:00')
where maChiTiet=157

select ngay, maNKSLK, DATEADD(day, 1, ngay) from NKSLK order by ngay asc

insert into NKSLK_ChiTiet(maNKSLK,maNhanCong,gioBatDau,gioKetThuc)
values(12,7,CONVERT(time, '01:00:00'),CONVERT(time, '08:00:00'))

select maChitiet, maNhanCong, gioBatDau, gioKetThuc, dbo.f_get_time(gioBatDau,0), dbo.f_get_time(gioKetThuc,1)
from NKSLK_ChiTiet
*/

---------------------
-- caau 13: Hiển thị số ngày công đi làm trong tháng của một công nhân bất
-- kỳ, của toàn bộ công nhân trong nhà máy (quy đổi ra công bằng
-- cách 8h tương đương 1 công, riêng ca 3 thì được nhân hệ số 1.3)

-- main
select maNhanCong, hoTen,  [dbo].[f_get_cong_thang_CN](maNhanCong, 11,2018)/8 as cong
from NhanCong

/*
select * from NKSLK where maNKSLK=28
select v.*, dbo.f_get_time(gioBatDau ,0),dbo.f_get_time(gioKetThuc ,1) from v_cong v where maNhanCong=2 and ngay='2019-01-06'
select ct.*, dbo.f_get_time(gioBatDau ,0),dbo.f_get_time(gioKetThuc ,1) from NKSLK_chitiet ct where maNhanCong=2 and maNKSLK=28
 select dbo.f_get_cong_ngay_CN(2,'2019-01-06')


 declare @thang int =1
 declare @nam int = 2019
 declare @maNhanCong int = 2

select nc.maNhanCong,sum(dbo.f_get_cong_ngay_CN(nc.maNhanCong,nk.ngay) )
from NhanCong  nc
left join NKSLK_ChiTiet ct on nc.maNhanCong = ct.maNhanCong
left join NKSLK nk on nk.maNKSLK = ct.maChiTiet and DATEPART(year, nk.ngay) = @nam and DATEPART(month, nk.ngay) = @thang
group by nc.maNhanCong

select * 
from NhanCong  nc
left join NKSLK_ChiTiet ct on nc.maNhanCong = ct.maNhanCong
left join NKSLK nk on nk.maNKSLK = ct.maChiTiet and DATEPART(year, nk.ngay) = 2019 and DATEPART(month, nk.ngay) = 1
*/

-----------------
-- caua 14: Hiển thị thông tin lương sản phẩm của công nhân có lương sản phẩm cao nhất, ít nhất.

alter proc s14_nkslk
	@layCaoNhat int
as begin
	select top 1 with ties nc.maNhanCong, nc.hoTen, ROUND(sum(kct.sanLuongThucTe*cv.donGia),2) as luongSanPham
	from NhanCong nc
	left join NKSLK_ChiTiet nkct on nc.maNhanCong =nkct.maNhanCong
	left join NKSLK nk on nk.maNKSLK = nkct.maNKSLK
	left join DanhMucKhoan_ChiTiet kct on kct.maNKSLK = nk.maNKSLK
	left join CongViec cv on cv.maCongViec = kct.maCongViec
	group by nc.maNhanCong, nc.hoTen
	order by  
		case when @layCaoNhat =1 then sum(kct.sanLuongThucTe*cv.donGia) end desc ,
		case when @layCaoNhat <> 1 then sum(kct.sanLuongThucTe*cv.donGia) end asc 		
end

exec s14_nkslk 1
----------------------
-- câu 15: Hiển thị danh mục công nhân có số giờ làm việc trong tuần bất kỳ
-- vượt giờ công chuẩn trong tuần (44 là giờ chuẩn công nhân phải
-- làm khi tuần đó chẵn là tuần chẵn, >n (n là giờ chuẩn công nhân
-- phải làm khi tuần đó lẻ, được tính = tổng số ngày thường trong
-- tuần * 8 + 4 tiếng của ngày thứ 7, nếu tuần đó có thứ 7)

alter proc s15_nkslk @tuan as int , @thang AS INT, @nam AS INT
as
begin
	/*DECLARE @tuan as int = 5
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/


	Declare @yc int 
	Declare @count int, @t7 int

	-- dem so ngay di lam trong tuan
	select @count = ISNULL(count(*),0)
	from dbo.weeks_of_month(@nam,@thang) 
	where gweek=@tuan and gorder <>1 and gorder <>7

	-- xac dinh co thu 7 hay khong
	select @t7 = ISNULL(count(*),0)
	from dbo.weeks_of_month(@nam,@thang) 
	where gweek=@tuan and gorder =7

	set @yc = @count*8 + @t7*4

 
	select c.maNhanCong, c.hoTen, c.ngaySinh, c.gioiTinh
		, c.queQuan, c.luongBaoHiem, c.phongBan, c.chucVu, [dbo].[f_get_cong_tuan_CN](maNhanCong, @tuan,@thang, @nam) as TG
	from NhanCong c
	where [dbo].[f_get_cong_tuan_CN](c.maNhanCong, @tuan,@thang, @nam) > @yc
end


exec s15_nkslk 5,11,2018


-----------------
-- 20200302

create function dbo.udf_weeks_of_month (@fromdate date) 
returns table as return (
with n as (select n from (values(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) t(n))
, dates as (
  select top (datediff(day, @fromdate, dateadd(month, datediff(month, 0, @fromdate )+1, 0))) 
    [DateValue]=convert(date,dateadd(day,row_number() over(order by (select 1))-1,@fromdate))
  from n as deka cross join n as hecto
)
select 
    WeekOfMonth = row_number() over (order by datepart(week,DateValue))
  , Week        = datepart(week,DateValue)
  , WeekStart   = min(DateValue)
  , WeekEnd     = max(DateValue)
from dates
group by datepart(week,DateValue)
);


set datefirst 1;

select * from dbo.udf_weeks_of_month('20170101');

select * from dbo.weeks_of_month(2018,1)

 drop function dbo.weeks_of_month

create function dbo.weeks_of_month (@year int, @month int) 
returns @table TABLE( gday1 INT, gdate date, gorder int, gweek int) as begin
	

	DECLARE @c_day int, @c_date date,@c_gorder int, @c_week int, @idx int, @temp int
	set @idx = 1

	DECLARE @t_month TABLE ( gday INT, gdate date, gorder int, gweek int)
	;WITH N(N)AS (	
		SELECT 1 
		FROM (VALUES(1),(1),(1),(1),(1),(1))M(N)
	),
	tally(N)AS(
		SELECT ROW_NUMBER()OVER(ORDER BY N.N)FROM N,N a
	)

	insert into @t_month(gday,gdate) 
	SELECT N day,datefromparts(@year,@month,N) date FROM tally
	WHERE N <= day(EOMONTH(datefromparts(@year,@month,1)))


	DECLARE cursor_name CURSOR
		FOR select * from @t_month;
	OPEN cursor_name;
	
	FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
	WHILE @@FETCH_STATUS = 0  
		BEGIN
			set @temp = DATEPART(dw,@c_date)
			update @t_month set gweek=@idx, gorder=@temp where gday=@c_day
			IF @temp = 1 BEGIN
				SET @idx = @idx+1
			END;
			FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
		END;
	CLOSE cursor_name;
	DEALLOCATE cursor_name;


	insert @table select * from @t_month

	return
end;




 