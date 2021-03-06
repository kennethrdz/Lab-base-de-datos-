USE [BDproyecto]
GO
/****** Object:  UserDefinedFunction [dbo].[stripJob]    Script Date: 4/5/2018 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[stripJob] (@input VARCHAR(250))
RETURNS VARCHAR(250)
AS BEGIN
    DECLARE @job VARCHAR(250)

    SET @job = @Input

    SET @job = REPLACE(@job, 'j', '')
    SET @job = REPLACE(@job, 'a', '')

    RETURN @job
END
GO
/****** Object:  UserDefinedFunction [dbo].[stripWarehouse]    Script Date: 4/5/2018 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[stripWarehouse] (@input VARCHAR(250))
RETURNS VARCHAR(250)
AS BEGIN
    DECLARE @name VARCHAR(250)

    SET @name = @Input

    SET @name = REPLACE(@name, 'a', '')
    SET @name = REPLACE(@name, 'z', '')

    RETURN @name
END
GO
/****** Object:  Table [dbo].[JOBS]    Script Date: 4/5/2018 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBS](
	[job_id] [uniqueidentifier] NULL,
	[job_title] [nvarchar](50) NULL,
	[min_salary] [nchar](10) NULL,
	[max_salary] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBS_HISORY]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBS_HISORY](
	[employee_id] [uniqueidentifier] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[job_id] [int] NULL,
	[department_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_jobAndHisory]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_jobAndHisory]
AS
SELECT JOBS.job_title,JOBS.max_salary,
JOBS_HISORY.end_date,JOBS_HISORY.start_date 
FROM JOBS 
CROSS JOIN JOBS_HISORY;
GO
/****** Object:  Table [dbo].[ORDER_ITEMS]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_ITEMS](
	[order_id] [uniqueidentifier] NOT NULL,
	[line_item_id] [varchar](max) NOT NULL,
	[product_id] [uniqueidentifier] NOT NULL,
	[unit_price] [varchar](max) NOT NULL,
	[quantity] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ORDER_ITEMS] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[order_id] [uniqueidentifier] NOT NULL,
	[order_date] [varchar](max) NOT NULL,
	[order_mode] [varchar](max) NOT NULL,
	[customer_id] [uniqueidentifier] NOT NULL,
	[order_status] [varchar](max) NOT NULL,
	[order_total] [int] NOT NULL,
	[sales_rep_id] [varchar](max) NOT NULL,
	[promotion_id] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_orderAndOrder_items]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_orderAndOrder_items]
AS
SELECT ORDERS.order_date,ORDERS.order_mode,
ORDER_ITEMS.quantity, ORDER_ITEMS.unit_price 
FROM ORDERS
CROSS JOIN ORDER_ITEMS;
GO
/****** Object:  Table [dbo].[PRODUCT_DESCRIPTIONS]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_DESCRIPTIONS](
	[product_id] [uniqueidentifier] NOT NULL,
	[language_id] [varchar](max) NOT NULL,
	[translated_name] [varchar](50) NOT NULL,
	[translated_description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PRODUCT_DESCRIPTIONS] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT_INFORMATION]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_INFORMATION](
	[product_id] [uniqueidentifier] NOT NULL,
	[product_name] [varchar](max) NOT NULL,
	[product_description] [varchar](max) NOT NULL,
	[category_id] [varchar](50) NOT NULL,
	[weight_class] [varchar](50) NOT NULL,
	[warranty_period] [varchar](50) NOT NULL,
	[supplier_id] [varchar](max) NOT NULL,
	[product_status] [varchar](max) NOT NULL,
	[list_price] [varchar](50) NOT NULL,
	[min_price] [int] NOT NULL,
	[catalog_url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PRODUCT_INFORMATION] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_productDescriptionAndproductInformation]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_productDescriptionAndproductInformation]
AS
SELECT PRODUCT_DESCRIPTIONS.translated_name,PRODUCT_DESCRIPTIONS.translated_description,
PRODUCT_INFORMATION.product_name,PRODUCT_INFORMATION.product_description
FROM PRODUCT_DESCRIPTIONS
CROSS JOIN PRODUCT_INFORMATION;
GO
/****** Object:  Table [dbo].[DEPARTAMENTS]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTS](
	[department_id] [int] NULL,
	[department_name] [varchar](50) NULL,
	[maneger_id] [nchar](10) NULL,
	[location_id] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [nchar](10) NULL,
	[hire_date] [date] NULL,
	[job_id] [int] NULL,
	[salary] [money] NULL,
	[commission_pct] [money] NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_emploteeAndDepartament]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_emploteeAndDepartament]
AS
SELECT Employees.first_name,Employees.last_name,
DEPARTAMENTS.department_name
FROM Employees
CROSS JOIN DEPARTAMENTS;
GO
/****** Object:  View [dbo].[view_jobHisoryAndDepartament]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_jobHisoryAndDepartament]
AS
SELECT JOBS_HISORY.end_date,JOBS_HISORY.start_date,
DEPARTAMENTS.department_name 
FROM JOBS_HISORY
CROSS JOIN DEPARTAMENTS;
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 4/5/2018 10:56:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[customer_id] [uniqueidentifier] NOT NULL,
	[cust_first_name] [varchar](50) NOT NULL,
	[cust_last_name] [varchar](50) NOT NULL,
	[cust_address] [varchar](50) NOT NULL,
	[phone_numbers] [int] NOT NULL,
	[nls_language] [varchar](max) NOT NULL,
	[nls_territory] [varchar](max) NOT NULL,
	[credit_limit] [int] NOT NULL,
	[cust_email] [varchar](max) NOT NULL,
	[account_mgr_id] [varchar](max) NOT NULL,
	[cust_geo_location] [varchar](50) NOT NULL,
	[date_of_birth] [int] NOT NULL,
	[marital_status] [varchar](max) NOT NULL,
	[gender] [varchar](max) NOT NULL,
	[income_level] [varchar](max) NOT NULL,
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVENTORIES]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTORIES](
	[product_id] [uniqueidentifier] NOT NULL,
	[warehouse_id] [uniqueidentifier] NOT NULL,
	[quantity_on_hand] [varchar](max) NOT NULL,
 CONSTRAINT [PK_INVENTORIES] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WAREHOUSES]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAREHOUSES](
	[warehouse_id] [uniqueidentifier] NOT NULL,
	[warehouse_spec] [varchar](max) NOT NULL,
	[warehouse_name] [varchar](50) NOT NULL,
	[location_id] [varchar](max) NOT NULL,
	[wh_geo_location] [varchar](max) NOT NULL,
 CONSTRAINT [PK_WAREHOUSES] PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[INVENTORIES]  WITH CHECK ADD  CONSTRAINT [FK_INVENTORIES_PRODUCT_INFORMATION] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT_INFORMATION] ([product_id])
GO
ALTER TABLE [dbo].[INVENTORIES] CHECK CONSTRAINT [FK_INVENTORIES_PRODUCT_INFORMATION]
GO
ALTER TABLE [dbo].[ORDER_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEMS_PRODUCT_INFORMATION] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT_INFORMATION] ([product_id])
GO
ALTER TABLE [dbo].[ORDER_ITEMS] CHECK CONSTRAINT [FK_ORDER_ITEMS_PRODUCT_INFORMATION]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMERS] FOREIGN KEY([customer_id])
REFERENCES [dbo].[CUSTOMERS] ([customer_id])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMERS]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_ORDER_ITEMS] FOREIGN KEY([order_id])
REFERENCES [dbo].[ORDER_ITEMS] ([order_id])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_ORDER_ITEMS]
GO
ALTER TABLE [dbo].[PRODUCT_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_INFORMATION_PRODUCT_DESCRIPTIONS] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT_DESCRIPTIONS] ([product_id])
GO
ALTER TABLE [dbo].[PRODUCT_INFORMATION] CHECK CONSTRAINT [FK_PRODUCT_INFORMATION_PRODUCT_DESCRIPTIONS]
GO
ALTER TABLE [dbo].[WAREHOUSES]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSES_INVENTORIES] FOREIGN KEY([warehouse_id])
REFERENCES [dbo].[INVENTORIES] ([warehouse_id])
GO
ALTER TABLE [dbo].[WAREHOUSES] CHECK CONSTRAINT [FK_WAREHOUSES_INVENTORIES]
GO
/****** Object:  StoredProcedure [dbo].[proc_addJob]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_addJob] 
				@job_idd uniqueidentifier,
				@job_titlee nchar(50),
				@min_salaryy nchar(10),
				@max_salaryy money
AS
INSERT INTO JOBS (job_id, job_title, min_salary,max_salary) 
VALUES(@job_idd, @job_titlee, @min_salaryy, @max_salaryy)
GO
/****** Object:  StoredProcedure [dbo].[sp_addCustomer]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_addCustomer]
				@cust_first varchar(50),
				@cust_last varchar(10),
				@cust_addres varchar(50),
				@phone int,
				@nls_language varchar(max),
				@nls_territory varchar(max),
				@credit int,
				@cust_email varchar(max),
				@account varchar(max),
				@cust_geo varchar(50),
				@date_of int,
				@marital varchar(max),
				@gender varchar(max),
				@income varchar(max)
AS
INSERT INTO CUSTOMERS(customer_id, cust_first_name, cust_last_name, cust_address, phone_numbers,nls_language,nls_territory,credit_limit,cust_email,account_mgr_id,cust_geo_location,date_of_birth,marital_status,gender,income_level)
VALUES (NEWID(), @cust_first, @cust_last,@cust_addres,@phone,@nls_language, @nls_territory,@credit,@cust_email,@account,@cust_geo,@date_of,@marital,@gender,@income);
GO
/****** Object:  StoredProcedure [dbo].[sp_addJob]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addJob] 
				@job_titlee nchar(50),
				@min_salaryy nchar(10),
				@max_salaryy money
AS
INSERT INTO JOBS (job_id, job_title, min_salary,max_salary) 
VALUES(NEWID(), @job_titlee, @min_salaryy, @max_salaryy)
GO
/****** Object:  StoredProcedure [dbo].[sp_addWarehouse]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addWarehouse] 
				@spec varchar(50),
				@name varchar(50),
				@location varchar(50),
				@wh_geo varchar(50)
AS
INSERT INTO WAREHOUSES(warehouse_id, warehouse_spec, warehouse_name,location_id,wh_geo_location) 
VALUES(NEWID(), @spec, @name, @location,@wh_geo)
GO
/****** Object:  StoredProcedure [dbo].[sp_dropCustomer]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropCustomer]
				@cust_first as varchar(30)
AS
DELETE FROM CUSTOMERS WHERE cust_first_name = @cust_first
GO
/****** Object:  StoredProcedure [dbo].[sp_dropDepartament]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dropDepartament]
				@departament as varchar(50)
AS
DELETE FROM DEPARTAMENTS WHERE department_name = @departament
GO
/****** Object:  StoredProcedure [dbo].[sp_dropEmployee]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropEmployee]
				@first as varchar(50)
AS
DELETE FROM Employees WHERE first_name = @first
GO
/****** Object:  StoredProcedure [dbo].[sp_dropJob]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropJob]
				@job_title as varchar(30)
AS
DELETE FROM JOBS WHERE job_title = @job_title
GO
/****** Object:  StoredProcedure [dbo].[sp_dropProductDescription]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dropProductDescription]
				@name as varchar(50)
AS
DELETE FROM PRODUCT_DESCRIPTIONS WHERE translated_name = @name
GO
/****** Object:  StoredProcedure [dbo].[sp_dropProductInformation]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropProductInformation]
				@name as varchar(50)
AS
DELETE FROM PRODUCT_INFORMATION WHERE product_name = @name
GO
/****** Object:  StoredProcedure [dbo].[sp_dropWarehouse]    Script Date: 4/5/2018 10:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dropWarehouse]
				@name as varchar(30)
AS
DELETE FROM WAREHOUSES WHERE warehouse_name = @name
GO
