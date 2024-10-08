USE [OQC]
GO
/****** Object:  Table [dbo].[tblCATEGORY]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCATEGORY](
	[CategoryID] [nvarchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[bDeleted] [bit] NULL,
	[Codepallet] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMessages]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Messages] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMsg]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChatMsg] [nvarchar](200) NOT NULL,
	[ImgUrl] [nvarchar](100) NULL,
	[FilePath] [nvarchar](100) NULL,
	[Sender] [varchar](50) NOT NULL,
	[Receiver] [varchar](50) NOT NULL,
	[RecevierSeen] [int] NOT NULL,
	[TimeSent] [datetime] NOT NULL,
 CONSTRAINT [PK_tblMsg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMsgGroup]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMsgGroup](
	[MsgID] [int] NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[RecevierSeen] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPRODUCT_DECT]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPRODUCT_DECT](
	[STR_MEMBER_CODE] [nvarchar](20) NOT NULL,
	[TMR_DATE] [datetime] NOT NULL,
	[STR_PROCESS] [nvarchar](32) NOT NULL,
	[STR_PROCESS_FACTORY] [nvarchar](30) NOT NULL,
	[STR_SERIAL] [nvarchar](30) NOT NULL,
	[COD_SCALE_NO] [nvarchar](20) NOT NULL,
	[bShrinked] [bit] NOT NULL,
	[STATUS] [tinyint] NULL,
	[OUTER_CARTON] [nvarchar](30) NULL,
	[SERIAL_OUTER] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPRODUCT_DP]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPRODUCT_DP](
	[STR_MEMBER_CODE] [nvarchar](20) NOT NULL,
	[TMR_DATE] [datetime] NOT NULL,
	[STR_PROCESS] [nvarchar](30) NOT NULL,
	[STR_PROCESS_FACTORY] [nvarchar](30) NOT NULL,
	[STR_SERIAL] [nvarchar](30) NOT NULL,
	[COD_SCALE_NO] [nvarchar](20) NOT NULL,
	[bShrinked] [bit] NOT NULL,
	[STATUS] [tinyint] NULL,
	[OUTER_CARTON] [nvarchar](30) NULL,
	[SERIAL_OUTER] [nvarchar](50) NULL,
	[STATUS_BF] [nchar](1) NOT NULL,
	[DATEINSERT] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[LevelID] [int] NOT NULL,
	[Section] [nvarchar](50) NULL,
	[ROLE] [nvarchar](50) NULL,
	[U_ACTIVE] [nvarchar](1) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_tblUser_U_ACTIVE]  DEFAULT (N'Y') FOR [U_ACTIVE]
GO
/****** Object:  StoredProcedure [dbo].[Get_model_pickup]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_model_pickup]  --Get_model_pickup '2024-09-18',''
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)

AS
BEGIN
	
	--select distinct STR_PROCESS_FACTORY FROM [OQC].[dbo].[TBLPRODUCT_DP] where CONVERT(date,TMR_DATE)=CONVERT(date,@fromdate)

	select distinct STR_PROCESS_FACTORY FROM [OQC].[dbo].[TBLPRODUCT_DP] where CONVERT(date,TMR_DATE)<=CONVERT(date,@fromdate)  --teset

END
GO
/****** Object:  StoredProcedure [dbo].[getData_tblMsg]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getData_tblMsg]
@UserID varchar(20)

AS
BEGIN
	
	select distinct A.ChatMsg,C.FullName,C.Name,A.ImgUrl,A.FilePath, A.Sender,@UserID UserID,A.ID from tblMsg A
	inner join tblMsgGroup B on A.ID=B.MsgID
	inner join tblUser C on A.Sender=C.UserID
	where
	convert(date,A.TimeSent) between CONVERT(date, DATEADD(DAY,-2,GETDATE())) and convert(date,GETDATE()) order by A.ID

	select COUNT(*) NumberMsg from tblMsgGroup where UserID=@UserID and RecevierSeen=0
END

GO
/****** Object:  StoredProcedure [dbo].[getMessages]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMessages]

@Date varchar(20)
AS
BEGIN
	select Messages,ImageUrl,case when DATEDIFF(MINUTE, CreateDate, GETDATE())>60 then '1' else '0' end as Status ,CreateDate
	from tblMessages where CONVERT(date, CreateDate)=@Date order by  CreateDate desc
END

GO
/****** Object:  StoredProcedure [dbo].[insert_tblMessages]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_tblMessages]

@Messages nvarchar(max),
@ImageUrl varchar(200)

AS
BEGIN
	insert into tblMessages values(@Messages,@ImageUrl,GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[insert_tblMsg]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_tblMsg]

@ChatMsg nvarchar(max),
@ImgUrl varchar(200),
@FilePath varchar(200),
@Sender varchar(20)

AS
BEGIN
	insert into tblMsg values(@ChatMsg,@ImgUrl,@FilePath,@Sender,'GR',0,GETDATE())
	
	declare @MaxID int
	declare @UserID  varchar(20)
	set @MaxID=(select Max(ID) from tblMsg)
	
	DECLARE mycursor1 CURSOR FOR
	select UserID from tblUser where UserID<>@Sender
	Open mycursor1
	FETCH NEXT FROM mycursor1 INTO @UserID
	WHILE @@FETCH_STATUS=0
		BEGIN
			insert into tblMsgGroup values(@MaxID,@UserID,0)

			FETCH NEXT FROM mycursor1 INTO @UserID
		END
	CLOSE mycursor1
	DEALLOCATE mycursor1
END

GO
/****** Object:  StoredProcedure [dbo].[insert_tbluser]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[insert_tbluser]
	@UserID varchar(50),
	@FullName nvarchar(50),
	@Name nvarchar(50),
	@Password varchar(100),
	@Level int

AS
BEGIN
	IF NOT EXISTS (SELECT * FROM tblUser where UserID=@UserID )
    BEGIN
	insert into tblUser values(@UserID,@FullName,@Name,@Password,@Level)
	END
END


GO
/****** Object:  StoredProcedure [dbo].[pro_get_categogy]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pro_get_categogy]
	
AS
BEGIN
	
	select CategoryName,[Description] from [OQC].[dbo].[tblCATEGORY]

END
GO
/****** Object:  StoredProcedure [dbo].[pro_get_serialouter]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pro_get_serialouter] --pro_get_serialouter 'DP', 'VL-WD618    .%4IACA031728',''
	@catename as nvarchar(50),
	@serialouter as nvarchar(50),
	@serialinner as nvarchar(50)
AS
BEGIN

if(@catename = 'DP')
begin
	if exists(select * from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter)
	begin
		--da ton tai roi
		select *,'1' as trangthai from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter	
		--select 1
	end
	else
	begin
		-- chua ton tai
		-- chua duoc ban can
		select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER,'0' as trangthai
		--select 0
	end
end
else
begin
	--cate dect
	select 1
end


END
GO
/****** Object:  StoredProcedure [dbo].[pro_get_serialouter_update]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pro_get_serialouter_update]
	@serial_outer as nvarchar(50), 
	@serial_inner as nvarchar(50),
	@cate_name as nvarchar(50)
AS
BEGIN
	
	if exists(select * from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serial_outer and STR_SERIAL=@serial_inner and [status] = 1)
	begin
		-- trang thai = 3 la duoc check xong 
		update [OQC].[dbo].[TBLPRODUCT_DP] set [status]=3, DATEINSERT=GETDATE() where SERIAL_OUTER=@serial_outer and STR_SERIAL=@serial_inner and [status] = 1
		select 1
	end
	else
	begin
		select 0
	end


END
GO
/****** Object:  StoredProcedure [dbo].[pro_pickup_serialouter]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pro_pickup_serialouter] --pro_pickup_serialouter 'DECT', '','4IBCA035008','KX-TGC310GRW'
	@catename as nvarchar(50),
	@serialouter as nvarchar(50),
	@serialinner as nvarchar(50),
	@modelname as nvarchar(50)
AS
BEGIN

declare @soluonglaymau as nvarchar(10)
declare @line as nvarchar(10)
declare @timedate as nvarchar(20)
declare @STR_PROCESS_FACTORY as nvarchar(50)
declare @trangthai as nvarchar(10)


if(@catename = 'DP')
begin
	if exists(select * from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname)
	begin
		--da ton tai roi
		--select *,'2' as trangthai from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname	
		if (@serialouter='' and @serialinner='' and @modelname='') -- truong hop load ban dau
		begin
			--ton tai hang khong co outer va serial outer
			select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER,'3' as trangthai,'0' as act_qty
		end
		else
		begin	

			select top(1) @line=COD_SCALE_NO,@timedate=TMR_DATE,@STR_PROCESS_FACTORY=STR_PROCESS_FACTORY,@trangthai=[STATUS] from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname order by TMR_DATE desc			
			set @soluonglaymau = (select count(SERIAL_OUTER) as soluonglaymau from
			(select distinct SERIAL_OUTER from [OQC].[dbo].[TBLPRODUCT_DP] where STR_PROCESS_FACTORY=@STR_PROCESS_FACTORY and convert(date,TMR_DATE)=@timedate and COD_SCALE_NO=@line) as bang1)
			print @soluonglaymau

			select *,'2' as trangthai,@soluonglaymau as act_qty from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname	
		end
		--select 1
	end
	else
	begin
		-- and (OUTER_CARTON<>'' or OUTER_CARTON is not null) truong hop nay se xu ly sau
		-- chua ton tai
		if exists(select * from [FOSS1].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname)
		begin		
			insert into [OQC].[dbo].[TBLPRODUCT_DP] select * from [FOSS1].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname
			--list danh sach can check

			select top(1) @line=COD_SCALE_NO,@timedate=TMR_DATE,@STR_PROCESS_FACTORY=STR_PROCESS_FACTORY,@trangthai=[STATUS] from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname order by TMR_DATE desc			
			set @soluonglaymau = (select count(SERIAL_OUTER) as soluonglaymau from
			(select distinct SERIAL_OUTER from [OQC].[dbo].[TBLPRODUCT_DP] where STR_PROCESS_FACTORY=@STR_PROCESS_FACTORY and convert(date,TMR_DATE)=@timedate and COD_SCALE_NO=@line) as bang1)
			print @soluonglaymau

			select *,'1' as trangthai,@soluonglaymau as act_qty from [OQC].[dbo].[TBLPRODUCT_DP] where SERIAL_OUTER=@serialouter and OUTER_CARTON=@modelname	
			--select 1
		end
		else
		begin
			-- chua duoc ban can
			select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER,'0' as trangthai, '0' as act_qty
			--select 0
		end
	end
end
else if(@catename = 'DECT')  --cate dect
begin
	if exists(select * from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname)
	begin
		--da ton tai roi
		if (@serialouter='' and @serialinner='' and @modelname='') -- truong hop load ban dau
		begin
			--ton tai hang khong co outer va serial outer
			select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER,'3' as trangthai,'0' as act_qty
		end
		else
		begin
			select top(1) @line=COD_SCALE_NO,@timedate=TMR_DATE,@STR_PROCESS_FACTORY=STR_PROCESS_FACTORY,@trangthai=[STATUS] from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname order by TMR_DATE desc			
			set @soluonglaymau = ( select count(STR_SERIAL) as soluonglaymau from
			(select distinct STR_SERIAL from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_PROCESS_FACTORY=@STR_PROCESS_FACTORY and convert(date,TMR_DATE)=@timedate and COD_SCALE_NO=@line) as bang1)
			print @soluonglaymau
			
			select *,'2' as trangthai,@soluonglaymau as act_qty from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname order by TMR_DATE desc	
		end
		
		--select 1
	end
	else
	begin
		-- chua ton tai
		if exists(select * from [FOSS1].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname)
		begin		
			insert into [OQC].[dbo].[TBLPRODUCT_DECT] select * from [FOSS1].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname
			--list danh sach can check
			select top(1) @line=COD_SCALE_NO,@timedate=TMR_DATE,@STR_PROCESS_FACTORY=STR_PROCESS_FACTORY,@trangthai=[STATUS] from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname order by TMR_DATE desc			
			set @soluonglaymau = ( select count(STR_SERIAL) as soluonglaymau from
			(select distinct STR_SERIAL from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_PROCESS_FACTORY=@STR_PROCESS_FACTORY and convert(date,TMR_DATE)=@timedate and COD_SCALE_NO=@line) as bang1)
			print @soluonglaymau

			select *,'1' as trangthai,@soluonglaymau as act_qty from [OQC].[dbo].[TBLPRODUCT_DECT] where STR_SERIAL=@serialinner and STR_PROCESS=@modelname	
			--select 1
		end
		else
		begin
			-- chua duoc ban can
			select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER,'0' as trangthai, '0' as act_qty
			--select 0
		end
	end
end
else
begin
	--cac cate khac
	select '' as STR_MEMBER_CODE,'' as TMR_DATE,'' as STR_PROCESS_FACTORY,'' as STR_SERIAL,'' as COD_SCALE_NO,'' as STATUS, '' as OUTER_CARTON, '' as SERIAL_OUTER, '0' as trangthai, '0' as act_qty
	--select 0
end



END
GO
/****** Object:  StoredProcedure [dbo].[pro_user_login_N]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pro_user_login_N]
	@username as varchar(50),
	@password as varchar(50)
AS
BEGIN
	
	select * from tblUser where UserID = @username and Password=@password and U_ACTIVE = 'Y';	

END
GO
/****** Object:  StoredProcedure [dbo].[Select_pickup_sample]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Select_pickup_sample]
	
AS
BEGIN
	select top(500)* from [OQC].[dbo].[TBLPRODUCT_DP] where CONVERT(date,TMR_DATE)<=CONVERT(date,getdate()) order by DATEINSERT desc
END
GO
/****** Object:  StoredProcedure [dbo].[tblUsers_Valid]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[tblUsers_Valid]
	@UserID varchar(50),
	@Password varchar(100)

AS
BEGIN
	select * from tblUser where UserID=@UserID and Password=@Password
END


GO
/****** Object:  StoredProcedure [dbo].[update_tblMsg]    Script Date: 10/09/2024 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_tblMsg]

@UserID varchar(20)

AS
BEGIN
	update tblMsgGroup set RecevierSeen=1 where UserID=@UserID and RecevierSeen=0
END

GO
