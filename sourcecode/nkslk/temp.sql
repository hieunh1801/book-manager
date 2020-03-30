USE [nkslk]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_ngay_CN]    Script Date: 3/26/2020 10:28:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[f_get_cong_ngay_CN] 
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




------------------------------
USE [nkslk]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_tuan_CN]    Script Date: 3/26/2020 10:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[f_get_cong_tuan_CN] 
	(@maNhanCong int,  @tuan  INT,  @thang  INT , @nam  INT )
RETURNS float
as
begin

	/*DECLARE @maNhanCong int =7
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/

	DECLARE @res float
	

	select @res = sum([dbo].[f_get_cong_ngay_CN] (@maNhanCong, gdate) )
	from dbo.weeks_of_month(@nam,@thang)
	where gweek =@tuan

	if @res is null
		set @res = 0
	return @res
end



-------------------------------
USE [nkslk]
GO
/****** Object:  UserDefinedFunction [dbo].[f_get_cong_thang_CN]    Script Date: 3/26/2020 10:28:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[f_get_cong_thang_CN] 
	(@maNhanCong int,  @thang  INT , @nam  INT )
RETURNS float
as
begin

	/*DECLARE @maNhanCong int =7
	DECLARE @thang AS INT = 11
	DECLARE @nam AS INT = 2018*/

	DECLARE @res float

	select @res = sum([dbo].[f_get_cong_ngay_CN] (@maNhanCong, gdate) )
	from dbo.weeks_of_month(@nam,@thang)

	if @res is null
		set @res = 0
	return @res
end