use project;

select * from df_orders;

drop table df_orders; 


create table df_orders (order_id int primary key,
order_date date,
ship_mode varchar(20),
segment varchar(20),
country varchar(20),
city varchar(20),
state varchar(20),
postal_code varchar(20),
region varchar(20),
category varchar(20),
sub_category varchar(20),
product_id varchar(50),
quantity int,
discount decimal(7,2),
sale_price decimal(7,2),
profit decimal(7,2)
);

select * from df_orders;


# Find top 10 highest generating revenue products.

select * from df_orders
order by sale_price desc
limit 10;



# Find top 5 highest selling products in each region.

with cte as (
select product_id, region, sum(sale_price) as sales from df_orders
group by product_id, region)
select * from (
select *, row_number() over(partition by region order by sales desc) as rn
from cte) a
where rn <= 5;


# Find month over month growth comparison for 2022 and 2023 sales. eg: Jan 2022 vs Jan 2023

with cte as (
select year(order_date) as year_order, month(order_date) as mnth_order, sum(sale_price) as sales from df_orders 
group by year(order_date), month(order_date)
-- order by year_order, mnth_order
)
select mnth_order, sum(case when year_order = 2022 then sales else 0 end) as sales2022,
sum(case when year_order = 2023 then sales else 0 end) as sales2023
from cte
group by mnth_order
order by mnth_order;



# For each category which month had highest sales.


with cte as (
select category, date_format(order_date, "%Y-%m") as month_sales, sum(sale_price) as sales from df_orders
group by category, date_format(order_date, "%Y-%m")
order by category, month_sales)
select month_sales, category, sales from (
select month_sales, category, sales, row_number() over(partition by category order by sales desc) as rn
from cte) a
where rn = 1
order by sales desc;


# Which sub_category had highest growth by profit in 2023 compare to 2022?

with cte as (
select year(order_date) as year_order,sub_category, sum(sale_price) as sales from df_orders 
group by year(order_date),sub_category
-- order by year_order, mnth_order
)
,cte1 as (
select sub_category, sum(case when year_order = 2022 then sales else 0 end) as sales2022,
sum(case when year_order = 2023 then sales else 0 end) as sales2023
from cte
group by sub_category)
select *, (sales2023 - sales2022)*100/sales2022 as growth from cte1
order by growth desc
limit 1;