CREATE TABLE fact_sales (
  customer_ident INT NOT NULL, 
  date_id INT NOT NULL
)

CREATE TABLE dim_time (
   date_id  INT NOT NULL ,
   calendar_date_dt  DATETIME NOT NULL ,
   calendar_day_of_week_num  INT NOT NULL ,
   calendar_day_of_week_name  VARCHAR(15) NOT NULL ,
   calendar_day_of_month_num  INT NOT NULL ,
   calendar_day_of_year_num  INT NOT NULL ,
   calendar_week_num  INT NOT NULL ,
   calendar_month_num  INT NOT NULL ,
   calendar_month_name  VARCHAR (15) NOT NULL ,
   calendar_quarter_num  INT NOT NULL ,
   calendar_year_num  INT NOT NULL 
) 

CREATE TABLE dim_customer (
  customer_ident INT IDENTITY(1, 1), 
  customer_Number VARCHAR(5) NOT NULL, 
  customer_name VARCHAR(255) NOT NULL, 
  customer_city VARCHAR(255) NULL
)