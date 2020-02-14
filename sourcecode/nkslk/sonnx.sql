USE [nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s9_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s9_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s8_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s8_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s5_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s5_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s4_nkslk_congviec_dongiathaphon]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s4_nkslk_congviec_dongiathaphon]
GO
/****** Object:  StoredProcedure [dbo].[s4_nkslk_congviec_dongiacaohon]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s4_nkslk_congviec_dongiacaohon]
GO
/****** Object:  StoredProcedure [dbo].[s3_nkslk_congviec_dongiathap]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s3_nkslk_congviec_dongiathap]
GO
/****** Object:  StoredProcedure [dbo].[s3_nkslk_congviec_dongiacao]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s3_nkslk_congviec_dongiacao]
GO
/****** Object:  StoredProcedure [dbo].[s2_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s2_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s15_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s15_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s11_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s11_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s10_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s10_nkslk]
GO
/****** Object:  StoredProcedure [dbo].[s1_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP PROCEDURE [dbo].[s1_nkslk]
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet] DROP CONSTRAINT [fk_maNKSLK]
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet] DROP CONSTRAINT [fk_maNhanCong]
GO
ALTER TABLE [dbo].[emp_mgr] DROP CONSTRAINT [fk_emp]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] DROP CONSTRAINT [fk_maSanPham]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] DROP CONSTRAINT [fk_maNKSLK_2]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] DROP CONSTRAINT [fk_maCongViec]
GO
ALTER TABLE [dbo].[emp_mgr] DROP CONSTRAINT [DF__emp_mgr__NoOfRep__2B3F6F97]
GO
/****** Object:  Index [ind_maNKSLK]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_maNKSLK] ON [dbo].[NKSLK_ChiTiet]
GO
/****** Object:  Index [ind_maNhanCong]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_maNhanCong] ON [dbo].[NKSLK_ChiTiet]
GO
/****** Object:  Index [ind_phongBan]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_phongBan] ON [dbo].[NhanCong]
GO
/****** Object:  Index [ind_chucVu]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_chucVu] ON [dbo].[NhanCong]
GO
/****** Object:  Index [ind_maSanPham]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_maSanPham] ON [dbo].[DanhMucKhoan_ChiTiet]
GO
/****** Object:  Index [ind_maNKSLK_2]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_maNKSLK_2] ON [dbo].[DanhMucKhoan_ChiTiet]
GO
/****** Object:  Index [ind_maCongViec]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_maCongViec] ON [dbo].[DanhMucKhoan_ChiTiet]
GO
/****** Object:  Index [ind_donViKhoan]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP INDEX [ind_donViKhoan] ON [dbo].[CongViec]
GO
/****** Object:  View [dbo].[v_cong]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP VIEW [dbo].[v_cong]
GO
/****** Object:  View [dbo].[cong]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP VIEW [dbo].[cong]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[SanPham]
GO
/****** Object:  Table [dbo].[NKSLK_ChiTiet]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[NKSLK_ChiTiet]
GO
/****** Object:  Table [dbo].[NKSLK]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[NKSLK]
GO
/****** Object:  Table [dbo].[NhanCong]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[NhanCong]
GO
/****** Object:  Table [dbo].[emp_mgr]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[emp_mgr]
GO
/****** Object:  Table [dbo].[DanhMucKhoan_ChiTiet]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[DanhMucKhoan_ChiTiet]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP TABLE [dbo].[CongViec]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_time]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_time]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_week]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_salary_week]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_month]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_salary_month]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_day]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_salary_day]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_tuan_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_cong_tuan_CN]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_thang_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_cong_thang_CN]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_ngay_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP FUNCTION [dbo].[f_get_cong_ngay_CN]
GO
USE [master]
GO
/****** Object:  Database [nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
DROP DATABASE [nkslk]
GO
/****** Object:  Database [nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE DATABASE [nkslk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nkslk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\nkslk.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nkslk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\nkslk_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [nkslk] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nkslk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nkslk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nkslk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nkslk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nkslk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nkslk] SET ARITHABORT OFF 
GO
ALTER DATABASE [nkslk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nkslk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nkslk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nkslk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nkslk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nkslk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nkslk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nkslk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nkslk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nkslk] SET  ENABLE_BROKER 
GO
ALTER DATABASE [nkslk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nkslk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nkslk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nkslk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nkslk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nkslk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nkslk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nkslk] SET RECOVERY FULL 
GO
ALTER DATABASE [nkslk] SET  MULTI_USER 
GO
ALTER DATABASE [nkslk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nkslk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nkslk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nkslk] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [nkslk] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'nkslk', N'ON'
GO
USE [nkslk]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_ngay_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[f_get_cong_ngay_CN] 
	(@maNhanCong int, @i_ngay date)
RETURNS float
as
begin
-- declare @maNhanCong int=7, @i_ngay date='2018-11-27'

DECLARE @result TABLE (
				maCongNhan INT
				,hoTenTen nvarchar(50)
				,ngay date
				,soLuong float
				,ca3 float
				,tongTG float
			);
DECLARE @tong float, @ca3 float, @from time(7), @to time(7), @tongTG float, @res float
DECLARE @maNhanCong1 int, @hoTenTen1 nvarchar(50), @gioBatDau1 time(7), @gioKetThuc1 time(7) ,@ngay1 date, @tenCongViec1 nvarchar(50)
		,@maNhanCong2 int, @hoTenTen2 nvarchar(50), @gioBatDau2 time(7), @gioKetThuc2 time(7) ,@ngay2 date, @tenCongViec2 nvarchar(50)
DECLARE cursor_c CURSOR
	FOR SELECT * FROM v_cong 
		 where ngay=@i_ngay and maNhanCong =@maNhanCong
		order by ngay, maNhanCong, gioBatDau asc 
	OPEN cursor_c;
 
	FETCH NEXT FROM cursor_c INTO 
		@maNhanCong1, @hoTenTen1, @gioBatDau1, @gioKetThuc1,@ngay1, @tenCongViec1;
	SET @tong=0
	SET @ca3=0
	set @from=@gioBatDau1
	set @to=@gioKetThuc1
	--print concat(dbo.f_get_time(@from ,0),' va ', dbo.f_get_time(@to ,1))
	--print concat(@from,' va ', @to)
	WHILE @@FETCH_STATUS = 0
		BEGIN
			
			
			FETCH NEXT FROM cursor_c INTO @maNhanCong2, @hoTenTen2, @gioBatDau2, @gioKetThuc2,@ngay2, @tenCongViec2;
			--print concat('@gioBatDau2: ',@gioBatDau2)
			if @@FETCH_STATUS = 0
				begin 
									if dbo.f_get_time(@to ,1) >= dbo.f_get_time(@gioBatDau2 ,0)
										begin 
											--print 'giao '
											if dbo.f_get_time(@to ,1) <= dbo.f_get_time(@gioKetThuc2 ,1)
												begin 
													set @to=@gioKetThuc2
												end
										end
									else
										begin
											--print ' khong giao '
											--print @tong
											set @tong = @tong +  dbo.f_get_time(@to ,1)- dbo.f_get_time(@from ,0)
											if dbo.f_get_time(@to ,1)<=30 and dbo.f_get_time(@to ,1) >= 24
												begin
													set @ca3 = @ca3+ dbo.f_get_time(@to ,1) - 24
												end
											if dbo.f_get_time(@to ,1)>=22 and dbo.f_get_time(@to ,1)<=24
												set @ca3 = @ca3+ dbo.f_get_time(@to ,1)-22
											if dbo.f_get_time(@from ,0)  >= 22
												begin
													set @ca3 = @ca3+ 24-dbo.f_get_time(@from ,0)
												end
											set @from=@gioBatDau2
											set @to=@gioKetThuc2
										
										end
				end
			else
				begin 
				--print 'here'
					 --print @tong
					set @tong = @tong +  dbo.f_get_time(@to ,1)- dbo.f_get_time(@from ,0)
					--print concat('tong 1: ',@tong)
					if dbo.f_get_time(@to ,1) <=30 and dbo.f_get_time(@to ,1) >= 24
						begin
							set @ca3 = @ca3+ dbo.f_get_time(@to ,1) - 24
						end
					if dbo.f_get_time(@to ,1)>=22 and dbo.f_get_time(@to ,1)<=24
						set @ca3 = @ca3+ dbo.f_get_time(@to ,1)-22

					if dbo.f_get_time(@from ,0)  <= 22 and dbo.f_get_time(@to ,1)  >=24
						begin
							set @ca3 = @ca3+ 2
						end
					if dbo.f_get_time(@from ,0)  <= 22 and dbo.f_get_time(@to ,1)  <24 and  dbo.f_get_time(@to ,1)  >22
						begin
							set @ca3 = @ca3+ dbo.f_get_time(@to ,1) -22
						end
					if dbo.f_get_time(@from ,0)  > 22 and dbo.f_get_time(@from ,0)  <=24  and dbo.f_get_time(@to ,1)  >=24
						begin
							set @ca3 = @ca3+ 24 - dbo.f_get_time(@from ,0)
						end
					if dbo.f_get_time(@from ,0)  > 22 and dbo.f_get_time(@from ,0)  <=24 and dbo.f_get_time(@to ,1)  <24
						begin
							set @ca3 = @ca3+ dbo.f_get_time(@to ,1) - dbo.f_get_time(@from ,0)
						end
					set @tongTG = @tong + @ca3*0.3
					insert @result(maCongNhan,hoTenTen,ngay,soLuong,ca3, tongTG) values (@maNhanCong1,@hoTenTen1,@ngay1,@tong,@ca3, @tongTG)
				end;
		END;
 
	CLOSE cursor_c;
	DEALLOCATE cursor_c;

	select @res=tongTG from @result

	if @res is null
		set @res = 0


	 --select @res

	return @res
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_thang_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_get_cong_thang_CN] 
	(@maNhanCong int,  @thang  INT , @nam  INT )
RETURNS float
as
begin

	/*DECLARE @maNhanCong int =7
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/

	DECLARE @c_day int, @c_date date,@c_gorder int, @c_week int, @idx int, @temp int, @res float
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
	SELECT N day,datefromparts(@nam,@thang,N) date FROM tally
	WHERE N <= day(EOMONTH(datefromparts(@nam,@thang,1)))


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

	select @res = sum([dbo].[f_get_cong_ngay_CN] (@maNhanCong, gdate) )
	from @t_month

	if @res is null
		set @res = 0
	return @res
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_tuan_CN]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_get_cong_tuan_CN] 
	(@maNhanCong int,  @tuan  INT,  @thang  INT , @nam  INT )
RETURNS float
as
begin

	/*DECLARE @maNhanCong int =7
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/

	DECLARE @c_day int, @c_date date,@c_gorder int, @c_week int, @idx int, @temp int, @res float
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
	SELECT N day,datefromparts(@nam,@thang,N) date FROM tally
	WHERE N <= day(EOMONTH(datefromparts(@nam,@thang,1)))


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

	select @res = sum([dbo].[f_get_cong_ngay_CN] (@maNhanCong, gdate) )
	from @t_month
	where gweek =@tuan

	if @res is null
		set @res = 0
	return @res
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_day]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_month]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[f_get_salary_month]
( @maNhanCong int,  @month int, @year int )
RETURNS float
AS
begin

	DECLARE @c_day int, @c_date date,@c_gorder int, @c_week int, @idx int, @temp int, @res float
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


	SELECT @res = sum ( dbo.f_get_salary_day(@maNhanCong,gdate))
	from @t_month

	return @res
end
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_salary_week]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[f_get_salary_week]
( @maNhanCong int,  @week int,  @month int, @year int )
RETURNS float
AS
begin

	DECLARE @c_day int, @c_date date,@c_gorder int, @c_week int, @idx int, @temp int, @res float
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


	SELECT @res = sum ( dbo.f_get_salary_day(@maNhanCong,gdate))
	from @t_month
	where gweek=@week

	return @res
end

GO
/****** Object:  UserDefinedFunction [dbo].[f_get_time]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_get_time]
( @gio time(7), @kt int )

RETURNS float

AS

BEGIN

	DECLARE @time float, @hour int, @minute int;

	set @hour = DATEPART(HOUR, @gio)
	set @minute = DATEPART(MINUTE, @gio)



	if (@hour>=0 and @hour<=6)
	begin
		set @hour = @hour + 24
	end
	

	if (@hour=30 and @kt=0)
	begin
		set @hour = @hour - 24
	end

	/*if (@hour>=6 and @kt=1 and @hour<24)
	begin
		set @hour = @hour + 24
	end*/

	set @time = @hour + @minute/60.0;

RETURN @time;

END;
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[tenCongViec] [nvarchar](50) NULL,
	[dinhMucKhoan] [float] NULL,
	[donViKhoan] [nvarchar](20) NULL,
	[heSoKhoan] [float] NULL,
	[dinhMucLaoDong] [float] NULL,
	[donGia] [float] NULL,
	[maCongViec] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucKhoan_ChiTiet]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DanhMucKhoan_ChiTiet](
	[maNKSLK] [int] NULL,
	[maCongViec] [int] NULL,
	[sanLuongThucTe] [float] NULL,
	[soLoSanPham] [varchar](20) NULL,
	[maSanPham] [int] NULL,
	[maChiTiet] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[emp_mgr]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[emp_mgr](
	[emp] [char](2) NOT NULL,
	[mgr] [char](2) NULL,
	[NoOfReports] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanCong]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanCong](
	[hoTen] [nvarchar](50) NULL,
	[ngaySinh] [date] NULL,
	[phongBan] [nvarchar](50) NULL,
	[chucVu] [nvarchar](50) NULL,
	[queQuan] [nvarchar](50) NULL,
	[luongBaoHiem] [float] NULL,
	[maNhanCong] [int] IDENTITY(1,1) NOT NULL,
	[gioiTinh] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NKSLK]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NKSLK](
	[ngay] [date] NULL,
	[maNKSLK] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNKSLK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NKSLK_ChiTiet]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NKSLK_ChiTiet](
	[maNKSLK] [int] NULL,
	[maNhanCong] [int] NULL,
	[gioBatDau] [time](7) NULL,
	[gioKetThuc] [time](7) NULL,
	[maChiTiet] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[tenSanPham] [nvarchar](50) NULL,
	[soDangKy] [varchar](20) NULL,
	[hanSuDung] [date] NULL,
	[quyCach] [nvarchar](20) NULL,
	[ngayDangKy] [date] NULL,
	[maSanPham] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[cong]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[cong] as
	select nc.maNhanCong, nc.hoTen, ct.gioBatDau, ct.gioKetThuc, nk.ngay, cv.tenCongViec
	from NhanCong nc 
	join NKSLK_ChiTiet ct on nc.maNhanCong = ct.maNhanCong
	join NKSLK nk on ct.maNKSLK = nk.maNKSLK
	join DanhMucKhoan_ChiTiet dmkct on nk.maNKSLK = dmkct.maNKSLK
	join CongViec cv on cv.maCongViec = dmkct.maCongViec
GO
/****** Object:  View [dbo].[v_cong]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_cong] as
	select nc.maNhanCong, nc.hoTen, ct.gioBatDau, ct.gioKetThuc, nk.ngay, cv.tenCongViec
	from NhanCong nc 
	join NKSLK_ChiTiet ct on nc.maNhanCong = ct.maNhanCong
	join NKSLK nk on ct.maNKSLK = nk.maNKSLK
	join DanhMucKhoan_ChiTiet dmkct on nk.maNKSLK = dmkct.maNKSLK
	join CongViec cv on cv.maCongViec = dmkct.maCongViec
GO
SET IDENTITY_INSERT [dbo].[CongViec] ON 

INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Đào Sản phẩm', 3.88, N'tấn', 1.95, 3.7, 234970.97938144332, 1)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Khai phá Sản phẩm công nghiệp', 3.35, N'cân', 4.83, 1.8, 327932.48955223884, 2)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Phát triển Đồ dùng gia dụng', 2.19, N'khối', 3.33, 3.71, 712826.18630136992, 3)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Nghiên cứu Khoáng sản', 2.53, N'tấn', 4.19, 4.97, 1040062.667193676, 4)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Khai thác Tài nguyên', 4.18, N'ký', 2.61, 4.11, 324276.64019138756, 5)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Múc Than', 4.63, N'ký', 3.83, 3.57, 373160.45701943844, 6)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Khai phá Vũ khí công nghệ cao', 0.44, N'lạng', 4.12, 1.04, 1230516.6545454545, 7)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Nghiên cứu Vũ khí hủy diệt', 4.5, N'lạng', 2.72, 2.6, 198581.76, 8)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Múc Nhựa', 4.54, N'ký', 0.5, 3.62, 50377.004405286345, 9)
INSERT [dbo].[CongViec] ([tenCongViec], [dinhMucKhoan], [donViKhoan], [heSoKhoan], [dinhMucLaoDong], [donGia], [maCongViec]) VALUES (N'Đào Vàng', 2.59, N'cân', 4.7, 4.6, 1054788.8803088802, 10)
SET IDENTITY_INSERT [dbo].[CongViec] OFF
SET IDENTITY_INSERT [dbo].[DanhMucKhoan_ChiTiet] ON 

INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (16, 2, 4.13, N't8sA8Vuqf0cHEM5e2', 10, 1)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (6, 5, 2.55, N'XhxfNtDFNoS', 9, 2)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (22, 2, 0.23, N'tFnjqnaGYYGH', 36, 3)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (29, 7, 8.41, N'PvGRQX0ePg', 28, 4)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (10, 5, 6.03, N'KD1eumO9O2rJwrnFJq', 8, 5)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (14, 9, 7.88, N'gf5wu1PJZbgqqV', 26, 6)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (11, 8, 1.38, N'cEVMqwThijmFOe3s5e', 15, 7)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 7, 1.7, N'9veqwKYhhX', 19, 8)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (29, 9, 8.71, N'Ajfn9xaWaAYWn', 26, 9)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (21, 4, 5.69, N'CuiAU9Y9UFCKZ5UiPtcY', 42, 10)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 9, 3.4, N'NRS1l8uBuW7w3nwF8K', 2, 11)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 7, 3.76, N'BszInQJzZTtA70', 21, 12)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (19, 5, 5.1, N'Dc45PU4fCveWyBZ', 4, 13)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (8, 5, 9.87, N'N9dklZM2qWcPyh', 22, 14)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (17, 2, 8.05, N'xVOvZMxwPVdstTXvtz', 17, 15)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 4, 8.21, N'mjUywYqukG', 44, 16)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (22, 8, 3.21, N'aMaSp783kG4y1pHi', 14, 17)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (3, 9, 6.17, N'DyhWVGl3AFCht', 5, 18)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (23, 3, 4.22, N'voeeb9EM7et91G7', 26, 19)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (2, 9, 3.04, N'rCZ55dl5SCjq12f2', 4, 20)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 9, 7.64, N'zOhYxeJ3HfitEL', 16, 21)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (26, 10, 1.52, N'plh1pEd1XdKEk', 40, 22)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (23, 9, 1.5, N'iOA5MXW3Zv00dIGue', 33, 23)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (12, 8, 3.82, N'vULGVHkp4Up2Gq4K', 48, 24)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (18, 9, 8.59, N'DuPg7JOMBtgFouT0otLr', 50, 25)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (10, 8, 7.86, N'UsFjhm8cjY358cWObgB4', 32, 26)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (1, 5, 8.37, N'kOdvTHyHdO22', 34, 27)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (12, 4, 2.89, N'Ya5VjNnc09wqU', 4, 28)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (27, 6, 1.85, N'TJ15nH8W67i0MQJNiQ', 17, 29)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (2, 2, 2.37, N'REfDTUViJsGWTrv', 29, 30)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (17, 8, 6.7, N'zvtAu9f9gF', 13, 31)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (25, 5, 2.56, N'0KSSSQwF5VQk', 36, 32)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (18, 7, 1.66, N'gCtrsrQLWi6Wy1F6e', 47, 33)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (5, 8, 9.85, N'HLm3JNdvSJkT', 22, 34)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (17, 7, 2.06, N'yecyGfgQlayRT2P0UO', 46, 35)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (26, 2, 8.25, N'jc3Aw7dqPGBefuzcInH', 28, 36)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (28, 7, 2.69, N'vrBRwV5J2szsA', 13, 37)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (20, 1, 0.88, N'37obZz5Ip0mN', 18, 38)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (16, 10, 6.14, N'TZRW52afz89', 4, 39)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (25, 7, 5.46, N'VUi6oc5BmlTQyClZ', 17, 40)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (7, 10, 6.21, N'wX3wEx3g0qy', 2, 41)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (7, 10, 7.78, N'7BU1wHkqal3krv0V', 32, 42)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (1, 5, 7.89, N'FWjvQBttGJsb', 2, 43)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (25, 2, 2.56, N'EpIwTf6HvRpci', 37, 44)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (18, 1, 0.62, N'q2livNbwX5L', 16, 45)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (28, 3, 6.17, N'WXh2uxPA1H7Z', 31, 46)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (6, 10, 3.6, N'Cvum0xdOFZn2Av', 16, 47)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (9, 3, 3.98, N'wuViECAzWjZcJs2ct', 24, 48)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (18, 4, 6.26, N'WauNBYa2cDD', 50, 49)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (13, 3, 3.58, N'FqiNdMB1scr6oJLo', 16, 50)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (11, 1, 8.89, N'Apdcn6QZui03GGHcEsa', 46, 51)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (19, 5, 1.67, N'QWcyBF0wdHoD6EX', 15, 52)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (25, 9, 3.1, N'SgTAW9VE0I9B1jn0', 5, 53)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (12, 4, 5.41, N'MGjaMo5CWHharwA', 41, 54)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 9, 1.04, N'ZU5yNXGO9sav', 6, 55)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (14, 1, 0.58, N'ybqGN9CxSRcFW3o', 17, 56)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (15, 9, 0.11, N'1PhKR6KBWBewk5T', 31, 57)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (29, 7, 0.78, N'01wIRdwuRD', 43, 58)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (29, 9, 2.58, N'ztXF9k1y1VWcoTCykq', 36, 59)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (14, 4, 1.15, N'TB2QgN9derAMsnurRLmT', 1, 60)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (28, 2, 2.76, N'ldg8uaD6IaW3Xl982o9', 17, 61)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (5, 4, 3.2, N'GPg49tX2z77XqhJH', 43, 62)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (11, 2, 2.19, N'01STRGBYDbuB', 43, 63)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (4, 3, 7.95, N'okFzr6VTaJWw4PD2Hl', 35, 64)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (30, 8, 4.87, N'b1qfd8qMMJeH', 44, 65)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (25, 8, 5.76, N'Bwt3cZiVbm5WfxsiJ', 39, 66)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (9, 9, 9.07, N'29H7gSS0X7zLW', 26, 67)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (5, 10, 0.33, N'wIEqXbDxfU22WYpmGJH', 5, 68)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (3, 8, 1.84, N'f7HNHXuZn9A6irrEn', 11, 69)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (21, 1, 5.89, N'TgyH4OuZt9VGhDM7WUiO', 23, 70)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (16, 1, 9.02, N'uoH8mtqR38v3V9ZLzd', 14, 71)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (22, 3, 8.54, N'5RnSgIFZg1wPHfyrZVa', 36, 72)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (8, 3, 0.47, N'UzCbpiKuNRJ9mgBJmEZI', 4, 73)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (15, 5, 5.64, N'n9zXu68tnOpdVlaNEBU', 37, 74)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (14, 1, 3.04, N'IKtFE3NqF5AeeaHgNt4', 31, 75)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (1, 6, 1.16, N'WSDpaJSJiNUY', 14, 76)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (13, 8, 6.33, N'TYTw7eDo57QT', 40, 77)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (20, 8, 4.45, N'tnrtP9laqPasaXjqwZ', 12, 78)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (11, 5, 6.77, N'jVXSkkZh72PH', 47, 79)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (23, 4, 9.04, N'3vPbMfa1opHhCFy', 37, 80)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (21, 2, 0.59, N'wWZe6B91rMuNw', 48, 81)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (30, 10, 1.79, N'ekDUluo3C76Zjv7', 26, 82)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (30, 10, 2.73, N'CIXIwrzbvpaDN0i1G', 10, 83)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (17, 7, 1.95, N'VhZLMwI6ejFmKF', 47, 84)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (9, 5, 4.48, N'rggcuX9UCZI0nf5', 41, 85)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (9, 5, 6.52, N'3fIApuRTehe', 50, 86)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (9, 2, 9.5, N'DqBtmHkkRWBCu', 13, 87)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (10, 6, 5.06, N'Y9cVrX0WzHVLsw', 21, 88)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (29, 2, 7.43, N'emnH9NMMgwS41tvT', 46, 89)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (1, 10, 6.6, N'KCiwOpHpMo', 7, 90)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (13, 3, 3.17, N'BcyDF1t3hBgvPSVEOQRI', 40, 91)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (28, 6, 4.81, N'lnqp9RadncX', 32, 92)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (5, 9, 8.01, N'8cBSTlVvUyoFc1', 43, 93)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (4, 2, 9.56, N'1hE4wlH9X2q', 11, 94)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 6, 7.61, N'yTgrFsTlUlw', 19, 95)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 7, 6.68, N'ssP6xbmHUs1xwQVIp', 14, 96)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (5, 3, 0.3, N'IzeKbA0z7ROgzQ', 18, 97)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (8, 3, 9.35, N'E7vJtqjQLiHlgWsMdJR', 22, 98)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (24, 3, 0.71, N'JY6RWEgyRMjuf0TFLVs', 45, 99)
GO
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (19, 3, 6.94, N'npQra2HmAJkF', 26, 100)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (33, 1, 4, N'2343423dgdf', 11, 101)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (34, 2, 3, N'dfghdg4534', 12, 102)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (35, 3, 2, N'dfg5f345efd', 14, 103)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (36, 4, 4, N'54dgf454', 18, 104)
INSERT [dbo].[DanhMucKhoan_ChiTiet] ([maNKSLK], [maCongViec], [sanLuongThucTe], [soLoSanPham], [maSanPham], [maChiTiet]) VALUES (37, 5, 3, N'43543tdfg', 19, 105)
SET IDENTITY_INSERT [dbo].[DanhMucKhoan_ChiTiet] OFF
SET IDENTITY_INSERT [dbo].[NhanCong] ON 

INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Lã Công Ngọc', CAST(N'1987-07-17' AS Date), N'Nhân sự', N'Chủ tịch', N'Phú Yên', 1121549, 1, 0)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Đinh Đức Ngọc', CAST(N'1966-02-01' AS Date), N'Thị trường', N'Cộng tác viên', N'Bến Tre', 2934302, 2, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Hoàng Minh Hải', CAST(N'1980-09-13' AS Date), N'Đào tạo', N'Chủ tịch', N'Đồng Tháp', 2026267, 3, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Phạm Nam Trà', CAST(N'1952-09-26' AS Date), N'Kế toán', N'Trưởng bộ phận', N'Hải Dương', 3371142, 4, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Đỗ Hữu Khánh', CAST(N'1980-11-13' AS Date), N'Nhân sự', N'Quản lý', N'Thái Bình', 2586667, 5, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Sái Ngọc Trà', CAST(N'1971-04-20' AS Date), N'Thị trường', N'Giám đốc', NULL, 4874874, 6, 0)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Tống Đức Đại', CAST(N'1966-04-08' AS Date), N'Đào tạo', N'Trưởng phòng', NULL, 3085177, 7, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Đinh Hữu Khánh', CAST(N'1952-05-17' AS Date), N'Đào tạo', N'Trưởng bộ phận', NULL, 1201230, 8, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Triệu Văn Khánh', CAST(N'1975-08-15' AS Date), N'Quản lý', N'Nhân viên', NULL, 4346721, 9, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Kim Công Nam', CAST(N'1984-06-07' AS Date), N'Hành chính', N'Chủ tịch', NULL, 3952187, 10, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Tống Đức Nam', NULL, N'Hành chính', N'Phó phòng', N'Thừa Thiên Huế', 3095543, 11, 0)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Sái Huy Huy', NULL, N'Nhân sự', N'Phó phòng', N'Hậu Giang', 1119325, 12, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Lý Minh Đinh', NULL, N'Tài chính', N'Chủ tịch', N'Lâm Đồng', 4363772, 13, 0)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Lê Khánh Chiến', NULL, N'Hành chính', N'Trưởng phòng', N'Bình Phước', 4238500, 14, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Lã Văn Thanh', NULL, N'Nhân sự', N'Nhân viên', N'Tây Ninh', 4987237, 15, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Nguyễn Văn A', CAST(N'1972-03-20' AS Date), N'Thị trường', N'Chủ tịch', N'Ninh Bình', 4467021, 16, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Nguyễn Văn A', CAST(N'1988-06-30' AS Date), N'Hành chính', N'Trưởng phòng', N'Sơn La', 3861052, 17, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Nguyễn Văn A', CAST(N'1972-10-28' AS Date), N'Đào tạo', N'Cộng tác viên', N'Trà Vinh', 4557367, 18, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Nguyễn Văn A', CAST(N'1964-10-15' AS Date), N'Hành chính', N'Giám đốc', N'Bắc Kạn', 2785302, 19, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Nguyễn Văn A', CAST(N'1975-04-20' AS Date), N'Kinh doanh', N'Giám đốc', N'Ninh Thuận', 2458966, 20, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Triệu Khánh Tiến', CAST(N'1971-04-14' AS Date), N'Tài chính', N'Quản lý', N'Hà Nội', 2915099, 21, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Tống Thanh Sỹ', CAST(N'1976-11-02' AS Date), N'Kinh doanh', N'Quản lý', N'Hà Nội', 1041768, 22, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Triệu Minh Đinh', CAST(N'1963-12-08' AS Date), N'Đào tạo', N'Trưởng phòng', N'Hà Nội', 3606901, 23, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Trần Tùng Thắng', CAST(N'1978-12-14' AS Date), N'Nghiên cứu và Phát triển', N'Phó phòng', N'Hà Nội', 3424788, 24, 1)
INSERT [dbo].[NhanCong] ([hoTen], [ngaySinh], [phongBan], [chucVu], [queQuan], [luongBaoHiem], [maNhanCong], [gioiTinh]) VALUES (N'Kim Đức Nam', CAST(N'1985-12-17' AS Date), N'Nhân sự', N'Trưởng bộ phận', N'Hà Nội', 1889560, 25, 1)
SET IDENTITY_INSERT [dbo].[NhanCong] OFF
SET IDENTITY_INSERT [dbo].[NKSLK] ON 

INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-09-25' AS Date), 1)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-07-01' AS Date), 2)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-04-04' AS Date), 3)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-01-24' AS Date), 4)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-10-19' AS Date), 5)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-11-08' AS Date), 6)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-03-17' AS Date), 7)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-03-13' AS Date), 8)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-03-07' AS Date), 9)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-12-14' AS Date), 10)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-03-09' AS Date), 11)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-03-08' AS Date), 12)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-03' AS Date), 13)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-06-28' AS Date), 14)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-06-05' AS Date), 15)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-07-25' AS Date), 16)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-09-11' AS Date), 17)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-11-29' AS Date), 18)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-06-23' AS Date), 19)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-06-19' AS Date), 20)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-02-10' AS Date), 21)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-07-27' AS Date), 22)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-01-30' AS Date), 23)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-12-31' AS Date), 24)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-10-21' AS Date), 25)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-04-04' AS Date), 26)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-05-07' AS Date), 27)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2019-01-06' AS Date), 28)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-08' AS Date), 29)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-05-03' AS Date), 30)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-05-04' AS Date), 32)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-26' AS Date), 33)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-27' AS Date), 34)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-28' AS Date), 35)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-29' AS Date), 36)
INSERT [dbo].[NKSLK] ([ngay], [maNKSLK]) VALUES (CAST(N'2018-11-30' AS Date), 37)
SET IDENTITY_INSERT [dbo].[NKSLK] OFF
SET IDENTITY_INSERT [dbo].[NKSLK_ChiTiet] ON 

INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (1, 5, CAST(N'14:05:00' AS Time), CAST(N'22:04:00' AS Time), 1)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (2, 6, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 2)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (3, 19, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 3)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (4, 11, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 4)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (5, 23, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 5)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (6, 24, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 6)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (7, 1, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 7)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (8, 7, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 8)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (9, 4, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 9)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (10, 5, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 10)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 3, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 11)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 2, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 12)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 22, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 13)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 11, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 14)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 25, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 15)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (12, 11, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 16)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (12, 22, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 17)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (12, 11, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 18)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (12, 23, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 19)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (13, 7, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 20)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (13, 11, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 21)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (13, 7, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 22)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (13, 10, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 23)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (13, 23, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 24)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 8, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 25)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 5, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 26)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 7, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 27)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 17, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 28)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 12, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 29)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 1, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 30)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (14, 17, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 31)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 14, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 32)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 6, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 33)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 34)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 24, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 35)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 8, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 36)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (15, 19, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 37)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (16, 4, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 38)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (16, 21, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 39)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (16, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 40)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (16, 4, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 41)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 17, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 42)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 11, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 43)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 17, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 44)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 9, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 45)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 7, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 46)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 13, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 47)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 2, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 48)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 15, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 49)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 1, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 50)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (17, 22, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 51)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 23, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 52)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 22, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 53)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 1, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 54)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 6, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 55)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 10, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 56)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 17, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 57)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 13, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 58)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 19, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 59)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 11, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 60)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (18, 6, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 61)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 6, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 62)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 2, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 63)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 23, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 64)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 19, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 65)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 25, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 66)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 13, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 67)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 25, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 68)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (19, 14, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 69)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 13, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 70)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 4, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 71)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 6, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 72)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 21, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 73)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 14, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 74)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (20, 23, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 75)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 15, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 76)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 20, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 77)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 7, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 78)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 79)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 22, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 80)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (21, 7, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 81)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 2, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 82)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 21, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 83)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 10, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 84)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 12, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 85)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 2, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 86)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 22, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 87)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (22, 16, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 88)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 4, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 89)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 16, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 90)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 14, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 91)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 5, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 92)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 20, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 93)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 17, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 94)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 19, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 95)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 9, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 96)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 17, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 97)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (23, 21, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 98)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 1, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 99)
GO
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 15, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 100)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 24, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 101)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 4, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 102)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 16, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 103)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 4, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 104)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 16, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 105)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 7, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 106)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 10, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 107)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (24, 5, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 108)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 10, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 109)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 16, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 110)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 22, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 111)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 112)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 113)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 12, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 114)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 2, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 115)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 20, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 116)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (25, 2, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 117)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 22, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 118)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 25, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 119)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 18, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 120)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 17, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 121)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 11, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 122)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 17, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 123)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 7, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 124)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 5, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 125)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 126)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (26, 23, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 127)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (27, 22, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 128)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (27, 9, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 129)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (27, 10, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 130)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (27, 24, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 131)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 11, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 132)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 10, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 133)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 19, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 134)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 6, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 135)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 25, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 136)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 8, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 137)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 2, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 138)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 2, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 139)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (28, 11, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 140)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 6, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 141)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 6, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 142)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 24, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 143)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 18, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 144)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 20, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 145)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 8, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 146)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 4, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 147)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 9, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 148)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 2, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 149)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (29, 21, CAST(N'15:00:00' AS Time), CAST(N'23:00:00' AS Time), 150)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 5, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 151)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 5, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 152)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 12, CAST(N'14:00:00' AS Time), CAST(N'22:00:00' AS Time), 153)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 4, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 154)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 21, CAST(N'23:00:00' AS Time), CAST(N'06:00:00' AS Time), 155)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 2, CAST(N'14:00:00' AS Time), CAST(N'08:00:00' AS Time), 156)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (30, 7, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 157)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (32, 7, CAST(N'06:00:00' AS Time), CAST(N'09:30:00' AS Time), 167)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (12, 7, CAST(N'01:00:00' AS Time), CAST(N'06:00:00' AS Time), 168)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (11, 7, CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), 169)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (33, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 170)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (34, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 171)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (35, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 172)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (36, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 173)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (37, 7, CAST(N'06:00:00' AS Time), CAST(N'14:00:00' AS Time), 174)
INSERT [dbo].[NKSLK_ChiTiet] ([maNKSLK], [maNhanCong], [gioBatDau], [gioKetThuc], [maChiTiet]) VALUES (33, 7, CAST(N'22:00:00' AS Time), CAST(N'06:00:00' AS Time), 175)
SET IDENTITY_INSERT [dbo].[NKSLK_ChiTiet] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Vàng Cá voi', N'wv6Rp4BPRq', CAST(N'2033-12-04' AS Date), N'MPnatsBs', CAST(N'2019-02-15' AS Date), 1)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sản phẩm nông nghiệp Mỡ muỗi', N'HNhZH9amFHwW9fxyOYUX', CAST(N'2048-10-18' AS Date), N'ReePYUmLv', CAST(N'2019-08-06' AS Date), 2)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Gỗ Cá', N'yEjQXxW4lbT4Gh9TNd', CAST(N'2025-09-07' AS Date), N'jJDq7', CAST(N'2019-09-21' AS Date), 3)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Đồ dùng gia dụng Gan trời', N'Xi0DRmfHiE3hE', CAST(N'2050-12-01' AS Date), N'HQoSLV', CAST(N'2019-12-25' AS Date), 4)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Gỗ Thịt hổ', N'YvJdnoGPHTkEgm0Rp5aH', CAST(N'2026-12-07' AS Date), N'R2WfWyfM', CAST(N'2019-06-25' AS Date), 5)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Thùng Khoáng sản Mỡ muỗi', N'YGpTNaE8WK', CAST(N'2040-04-26' AS Date), N'NAt2Enw57N', CAST(N'2019-01-31' AS Date), 6)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Thùng Kim cương Gạo lứt', N'jq6dP8l1zPPWl', CAST(N'2022-10-23' AS Date), N'8o0vOTvsv', CAST(N'2019-08-21' AS Date), 7)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Vàng Thịt hổ', N'lOD3z4gAY1me', CAST(N'2032-01-27' AS Date), N'5AlO5', CAST(N'2019-03-11' AS Date), 8)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Vũ khí hủy diệt Cá', N'492KtOvon2un2PZPOIle', CAST(N'2025-10-17' AS Date), N'QbKjG5ZS', CAST(N'2019-07-20' AS Date), 9)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Sản phẩm công nghiệp Thùng nhựa', N'PawelYpuK4NubGYr', CAST(N'2023-08-04' AS Date), N'OMn02', CAST(N'2019-03-02' AS Date), 10)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Vũ khí hủy diệt 7Up', N'chgo0LpzTL88bt', CAST(N'2039-02-02' AS Date), N'FgKwQGYa', CAST(N'2019-11-12' AS Date), 11)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Vũ khí công nghệ cao Thịt heo', N'sbxjnlapWtHPjkhGGgvs', CAST(N'2041-07-19' AS Date), N'OMuh3', CAST(N'2019-10-26' AS Date), 12)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Vũ khí Thịt lợn', N'gtCgBJ46QT', CAST(N'2025-11-09' AS Date), N'NuyuI5v', CAST(N'2019-01-22' AS Date), 13)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Gỗ Rau xanh', N'4sdhrDcY1Gmd', CAST(N'2030-08-17' AS Date), N'dtoL5', CAST(N'2019-01-20' AS Date), 14)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Than Thịt hổ', N'Nr1iYKemZ7VjvqqzHc', CAST(N'2023-04-09' AS Date), N'rYDK7VXZaa', CAST(N'2019-07-05' AS Date), 15)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Thùng Than Gạo nếp', N'U3Dk6OnyxugkgAH4a', CAST(N'2028-09-23' AS Date), N'Jo8eZOK', CAST(N'2019-01-28' AS Date), 16)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Gỗ Rau muống', N'r76tsJeqkOKdXF', CAST(N'2038-04-02' AS Date), N'5S6qFQr', CAST(N'2019-09-22' AS Date), 17)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Gang Cá', N'ihciDpvbf7SxEJUbCGeO', CAST(N'2050-05-30' AS Date), N'iWcew4Z', CAST(N'2019-07-24' AS Date), 18)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Sản phẩm Mỡ muỗi', N'3YPUTuG9qap', CAST(N'2041-08-12' AS Date), N'MNC3fLFk', CAST(N'2019-12-16' AS Date), 19)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Vũ khí Pepsi', N'NYurs9F6OFvEaQPp', CAST(N'2026-07-30' AS Date), N'Ui6Gy', CAST(N'2019-08-23' AS Date), 20)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Gỗ Gạo', N'gxW4m2kGTry9UG8FNjx', CAST(N'2025-10-13' AS Date), N'2vR4h', CAST(N'2019-07-27' AS Date), 21)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Gỗ Gạo nếp', N'fTAAVA3k40oddVNZ5vzB', CAST(N'2030-12-01' AS Date), N'i5eMWi', CAST(N'2019-04-07' AS Date), 22)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Tài nguyên Gan trời', N'67LcduxcJYS', CAST(N'2025-06-11' AS Date), N'oAgxKxow9', CAST(N'2019-08-12' AS Date), 23)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Hóa chất 7Up', N'W9VvO5pQ673', CAST(N'2033-02-01' AS Date), N'7Z78Uag', CAST(N'2019-12-22' AS Date), 24)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Gỗ Rau xanh', N'u1OPp9qSVxQUA', CAST(N'2032-12-15' AS Date), N'n33iCd8', CAST(N'2019-11-15' AS Date), 25)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Kim cương Cá', N'FTOuTq7ZtZxVVU3', CAST(N'2024-04-28' AS Date), N'QGF5ss', CAST(N'2019-11-01' AS Date), 26)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Sản phẩm Thịt heo', N'HqUIuv5uEaR', CAST(N'2038-12-27' AS Date), N'4zAgM23', CAST(N'2019-08-11' AS Date), 27)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sản phẩm Cá mập', N'iQ9VAuTfsxVvjElt', CAST(N'2034-06-28' AS Date), N'bGP1N6bJG', CAST(N'2019-05-04' AS Date), 28)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sản phẩm nông nghiệp Đậu xanh', N'ymHM3QsbDy2Wah96', CAST(N'2021-09-07' AS Date), N'MEv3kS', CAST(N'2019-09-05' AS Date), 29)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Sắt Hộp nhựa', N'2GUhDic15B2OMU0gAWof', CAST(N'2040-11-03' AS Date), N'TSyhgG3Jx', CAST(N'2019-02-19' AS Date), 30)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Thùng Vũ khí Cá mập', N'iscIBEhrcdlcNv0', CAST(N'2043-11-23' AS Date), N'EjScOv', CAST(N'2019-07-19' AS Date), 31)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Kim cương Cá voi', N'MfU0AJaN84', CAST(N'2036-09-20' AS Date), N'I9QsAV', CAST(N'2019-04-24' AS Date), 32)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sản phẩm công nghiệp Rau xanh', N'PVH73n0ysZrTf', CAST(N'2025-09-02' AS Date), N'8wwqOR', CAST(N'2019-07-04' AS Date), 33)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Đồ dùng gia dụng Thịt lợn', N'srx8zMRpyILrm', CAST(N'2023-08-15' AS Date), N'Udd6QGTg7', CAST(N'2019-05-04' AS Date), 34)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Nhựa Cá voi', N'bRdMMdqnVsN1fWx', CAST(N'2047-02-28' AS Date), N'Aq5bx', CAST(N'2019-06-09' AS Date), 35)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Than Gạo nếp', N'loBnunKoPTT5oLpXd71c', CAST(N'2033-05-26' AS Date), N'thcKK', CAST(N'2019-10-06' AS Date), 36)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Gang Cá voi', N'GWNkJTHQJpXRw4hJReb', CAST(N'2025-01-27' AS Date), N'0sVI7Pp', CAST(N'2019-01-13' AS Date), 37)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Vàng Fanta', N'WB9S9dC20JWiF1tLEk', CAST(N'2025-03-15' AS Date), N'rtri9SpTgH', CAST(N'2019-12-31' AS Date), 38)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Kim cương Sữa', N'fPVdlHuipPZu3KM', CAST(N'2050-08-15' AS Date), N'5BqGEl', CAST(N'2019-03-30' AS Date), 39)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sản phẩm Gan trời', N'N21QRxorNHl0yvu', CAST(N'2029-06-25' AS Date), N'VWHOgMV30', CAST(N'2019-05-07' AS Date), 40)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Vũ khí hóa học Sữa', N'6aMahEuqtP', CAST(N'2038-09-20' AS Date), N'412iwWJ6vC', CAST(N'2019-05-18' AS Date), 41)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Sắt Hộp nhựa', N'52pBYU3ZvFPMuTTja', CAST(N'2042-10-21' AS Date), N'dB4kV', CAST(N'2019-12-27' AS Date), 42)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Nhựa Đậu xanh', N'cui6FKjQUpjOvl', CAST(N'2029-11-05' AS Date), N'uBliA', CAST(N'2019-04-18' AS Date), 43)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Vũ khí hủy diệt Gạo lứt', N'nze6sJFkvy0hOIW11', CAST(N'2042-08-09' AS Date), N'cQMpdC62l', CAST(N'2019-03-07' AS Date), 44)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Khối Thép Gạo nếp', N'MWLeKyzDAJRD', CAST(N'2048-04-07' AS Date), N'uPR3S', CAST(N'2019-08-01' AS Date), 45)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Can Gang Gan trời', N'ZFMoJdJnPq1', CAST(N'2021-07-26' AS Date), N'7hYz4pD0', CAST(N'2019-05-30' AS Date), 46)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Hộp Vũ khí Nước ngọt', N'BdkLpzFJ10qfxtaom', CAST(N'2034-07-12' AS Date), N'4uuRe', CAST(N'2019-01-27' AS Date), 47)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Thép Gạo tẻ', N'61BjwdJs80d1R7AVGl', CAST(N'2037-12-26' AS Date), N'8KgLlki', CAST(N'2019-04-09' AS Date), 48)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Túi Tài nguyên Gạo', N'LwUuS7sKgA6rrqOfCSTS', CAST(N'2024-10-08' AS Date), N'EXtoqIg', CAST(N'2019-07-12' AS Date), 49)
INSERT [dbo].[SanPham] ([tenSanPham], [soDangKy], [hanSuDung], [quyCach], [ngayDangKy], [maSanPham]) VALUES (N'Lốc Sắt Gạo tẻ', N'jt0b4to8GL', CAST(N'2048-09-07' AS Date), N'Vn1bwAqlD7', CAST(N'2019-12-08' AS Date), 50)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [ind_donViKhoan]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_donViKhoan] ON [dbo].[CongViec]
(
	[donViKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ind_maCongViec]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_maCongViec] ON [dbo].[DanhMucKhoan_ChiTiet]
(
	[maCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ind_maNKSLK_2]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_maNKSLK_2] ON [dbo].[DanhMucKhoan_ChiTiet]
(
	[maNKSLK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ind_maSanPham]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_maSanPham] ON [dbo].[DanhMucKhoan_ChiTiet]
(
	[maSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ind_chucVu]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_chucVu] ON [dbo].[NhanCong]
(
	[chucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ind_phongBan]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_phongBan] ON [dbo].[NhanCong]
(
	[phongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ind_maNhanCong]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_maNhanCong] ON [dbo].[NKSLK_ChiTiet]
(
	[maNhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ind_maNKSLK]    Script Date: 2/14/2020 11:26:30 PM ******/
CREATE NONCLUSTERED INDEX [ind_maNKSLK] ON [dbo].[NKSLK_ChiTiet]
(
	[maNKSLK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[emp_mgr] ADD  DEFAULT ((0)) FOR [NoOfReports]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet]  WITH CHECK ADD  CONSTRAINT [fk_maCongViec] FOREIGN KEY([maCongViec])
REFERENCES [dbo].[CongViec] ([maCongViec])
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] CHECK CONSTRAINT [fk_maCongViec]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet]  WITH CHECK ADD  CONSTRAINT [fk_maNKSLK_2] FOREIGN KEY([maNKSLK])
REFERENCES [dbo].[NKSLK] ([maNKSLK])
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] CHECK CONSTRAINT [fk_maNKSLK_2]
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet]  WITH CHECK ADD  CONSTRAINT [fk_maSanPham] FOREIGN KEY([maSanPham])
REFERENCES [dbo].[SanPham] ([maSanPham])
GO
ALTER TABLE [dbo].[DanhMucKhoan_ChiTiet] CHECK CONSTRAINT [fk_maSanPham]
GO
ALTER TABLE [dbo].[emp_mgr]  WITH CHECK ADD  CONSTRAINT [fk_emp] FOREIGN KEY([mgr])
REFERENCES [dbo].[emp_mgr] ([emp])
GO
ALTER TABLE [dbo].[emp_mgr] CHECK CONSTRAINT [fk_emp]
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet]  WITH CHECK ADD  CONSTRAINT [fk_maNhanCong] FOREIGN KEY([maNhanCong])
REFERENCES [dbo].[NhanCong] ([maNhanCong])
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet] CHECK CONSTRAINT [fk_maNhanCong]
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet]  WITH CHECK ADD  CONSTRAINT [fk_maNKSLK] FOREIGN KEY([maNKSLK])
REFERENCES [dbo].[NKSLK] ([maNKSLK])
GO
ALTER TABLE [dbo].[NKSLK_ChiTiet] CHECK CONSTRAINT [fk_maNKSLK]
GO
/****** Object:  StoredProcedure [dbo].[s1_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[s1_nkslk] 
	@macongnhan int,
	@week AS int,
	@month AS int,
	@Year AS int
AS
BEGIN
  DECLARE @t_month TABLE (
    gday int,
    gdate date,
    gorder int,
    gweek int
  )
  DECLARE @c_day int,
          @c_date date,
          @c_gorder int,
          @c_week int,
          @idx int,
          @temp int
  SET @idx = 1;
  WITH N (N) AS (SELECT 1 FROM (VALUES (1), (1), (1), (1), (1), (1)) M (N)),
	 tally (N) AS (SELECT ROW_NUMBER() OVER (ORDER BY N.N) FROM N, N a)

  INSERT INTO @t_month (gday, gdate)
    SELECT N day, datefromparts(@year, @month, N) date
    FROM tally
    WHERE N <= DAY(EOMONTH(datefromparts(@year, @month, 1)))


  DECLARE cursor_name CURSOR FOR
  SELECT *
  FROM @t_month;
  OPEN cursor_name;

  FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @temp = DATEPART(dw, @c_date)
    UPDATE @t_month
    SET gweek = @idx,
        gorder = @temp
    WHERE gday = @c_day
    IF @temp = 1
    BEGIN
      SET @idx = @idx + 1
    END;
    FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
  END;
  CLOSE cursor_name;
  DEALLOCATE cursor_name;

  SELECT gdate as ngay, gioBatDau, gioKetThuc
  FROM @t_month e
  LEFT JOIN NKSLK b ON e.gdate = b.ngay
  LEFT JOIN NKSLK_ChiTiet a ON a.maNKSLK = b.maNKSLK AND a.maNhanCong = @macongnhan
  WHERE gweek = @week

END
GO
/****** Object:  StoredProcedure [dbo].[s10_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[s10_nkslk]
as
begin
	select distinct nc.*
	from NhanCong nc
	inner join NKSLK_ChiTiet ct on ct.maNhanCong = nc.maNhanCong
	where ( dbo.f_get_time(ct.gioKetThuc,1) > 22  and dbo.f_get_time(ct.gioKetThuc,1) <= 30  )
end
GO
/****** Object:  StoredProcedure [dbo].[s11_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[s11_nkslk] 
	@week AS int,
	@month AS int,
	@Year AS int
AS
BEGIN
  DECLARE @t_month TABLE (
    gday int,
    gdate date,
    gorder int,
    gweek int
  )
  DECLARE @c_day int,
          @c_date date,
          @c_gorder int,
          @c_week int,
          @idx int,
          @temp int
  SET @idx = 1;
  WITH N (N) AS (SELECT 1 FROM (VALUES (1), (1), (1), (1), (1), (1)) M (N)),
	 tally (N) AS (SELECT ROW_NUMBER() OVER (ORDER BY N.N) FROM N, N a)

  INSERT INTO @t_month (gday, gdate)
    SELECT N day, datefromparts(@year, @month, N) date
    FROM tally
    WHERE N <= DAY(EOMONTH(datefromparts(@year, @month, 1)))


  DECLARE cursor_name CURSOR FOR
  SELECT *
  FROM @t_month;
  OPEN cursor_name;

  FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @temp = DATEPART(dw, @c_date)
    UPDATE @t_month
    SET gweek = @idx,
        gorder = @temp
    WHERE gday = @c_day
    IF @temp = 1
    BEGIN
      SET @idx = @idx + 1
    END;
    FETCH NEXT FROM cursor_name INTO @c_day, @c_date, @c_gorder, @c_week;
  END;
  CLOSE cursor_name;
  DEALLOCATE cursor_name;

	  select nc.maNhanCong, nc.hoTen, b.ngay, e.gweek, a.gioBatDau, a.gioKetThuc
	from @t_month e 
	left join NKSLK b on  e.gdate = b.ngay  -- and e.gweek = @week
	 left join  NKSLK_ChiTiet a on a.maNKSLK = b.maNKSLK 
	 right join NhanCong nc on a.maNhanCong = nc.maNhanCong
	 where e.gweek = @week
	 order by  b.ngay asc, nc.maNhanCong asc, a.gioBatDau asc

END
GO
/****** Object:  StoredProcedure [dbo].[s15_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s15_nkslk] @tuan as int , @thang AS INT, @nam AS INT
as
begin
	/*DECLARE @tuan as int = 5
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/

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
	SELECT N day,datefromparts(@nam,@thang,N) date FROM tally
	WHERE N <= day(EOMONTH(datefromparts(@nam,@thang,1)))


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


	Declare @yc int 
	Declare @count int, @t7 int

	-- dem so ngay di lam trong tuan
	select @count = ISNULL(count(*),0)
	from @t_month
	where gweek=@tuan and gorder <>1 and gorder <>7

	-- xac dinh co thu 7 hay khong
	select @t7 = ISNULL(count(*),0)
	from @t_month
	where gweek=@tuan and gorder =7

	set @yc = @count*8 + @t7*4

 
	select *, [dbo].[f_get_cong_tuan_CN](maNhanCong, @tuan,@thang, @nam) as TG
	from NhanCong
	where [dbo].[f_get_cong_tuan_CN](maNhanCong, @tuan,@thang, @nam) > @yc
end
GO
/****** Object:  StoredProcedure [dbo].[s2_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s2_nkslk]
as
begin
	select * 
	from CongViec 
	where maCongViec in (
		select top 1 with ties maCongViec
		from DanhMucKhoan_ChiTiet 
		group by maCongViec
		order by count(maChiTiet) desc
	)
end
GO
/****** Object:  StoredProcedure [dbo].[s3_nkslk_congviec_dongiacao]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s3_nkslk_congviec_dongiacao]
as
begin
	select  top 1 with ties *
	from CongViec 
	order by donGia desc
end;
GO
/****** Object:  StoredProcedure [dbo].[s3_nkslk_congviec_dongiathap]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s3_nkslk_congviec_dongiathap]
as
begin
	select  top 1 with ties *
	from CongViec 
	order by donGia asc
end;
GO
/****** Object:  StoredProcedure [dbo].[s4_nkslk_congviec_dongiacaohon]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s4_nkslk_congviec_dongiacaohon]
as
begin
	select *
	from CongViec
	where donGia > (
		select avg(dongia) from CongViec
	)
end
GO
/****** Object:  StoredProcedure [dbo].[s4_nkslk_congviec_dongiathaphon]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s4_nkslk_congviec_dongiathaphon]
as
begin
	select *
	from CongViec
	where donGia < (
		select avg(dongia) from CongViec
	)
end
GO
/****** Object:  StoredProcedure [dbo].[s5_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[s5_nkslk] 
	@ngay date
as
begin
	select * 
	from SanPham
	where ngayDangKy < @ngay
	order by ngayDangKy desc
end
GO
/****** Object:  StoredProcedure [dbo].[s8_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s8_nkslk]
as
begin
	select c.*, DATEDIFF(year, ngaySinh, GETDATE() ) as tuoi
	from NhanCong c
	where 
	( gioiTinh=1 and DATEADD(year,54,ngaySinh) between GETDATE() and DATEADD(year,1,GETDATE() ) )
	OR ( gioiTinh=0 and DATEADD(year,49,ngaySinh) between GETDATE() and DATEADD(year,1,GETDATE() ) )
end
GO
/****** Object:  StoredProcedure [dbo].[s9_nkslk]    Script Date: 2/14/2020 11:26:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[s9_nkslk]
as
begin
	select c.*, DATEDIFF(year, ngaySinh, GETDATE() ) as tuoi
	from NhanCong c
	where 
	DATEDIFF(year, ngaySinh, GETDATE() )  between 30 and 45
	order by DATEDIFF(year, ngaySinh, GETDATE() ) 
end
GO
USE [master]
GO
ALTER DATABASE [nkslk] SET  READ_WRITE 
GO
