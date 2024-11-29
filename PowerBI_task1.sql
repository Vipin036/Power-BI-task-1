create table products (ProductID int, ProductName varchar(60), Category varchar(60), Price real);
create table Sales (SaleID int, ProductID int, QuantitySold int, SaleDate date, SalespersonID int,Total_Sales int,Months int);
create table Salesperson (SalespersonID int, SalespersonName varchar(60), Region varchar(30));


\copy products from '/Users/vipinhedaoo/Documents/Data_Analytics/PostgreSQL/S_A_products.csv' Delimiter ',' csv header;
\copy Sales from '/Users/vipinhedaoo/Documents/Data_Analytics/PostgreSQL/S_A_Sales.csv' Delimiter ',' csv header;
\copy Salesperson from '/Users/vipinhedaoo/Documents/Data_Analytics/PostgreSQL/S_A_Salesperson.csv' Delimiter ',' csv header;

select * from products;
select * from Sales;
select * from salesperson;

-- Total Sales per Product
select p.productName,sum(s.Total_Sales) as Total_sales from products p
join sales s on p.productid = s.productid
group by p.productname
order by sum(s.total_sales) desc;

-- Total sales by region
select sp.Region,sum(s.total_sales) as Total_sales from salesperson sp
join sales s on sp.salespersonid = s.salespersonid
group by sp.Region
order by sum(s.total_sales) desc;

-- Average sales per salesperson
select sp.salespersonid,sp.salespersonname,round(avg(total_sales)) as avg_sales from salesperson sp
join sales s on sp.salespersonid = s.salespersonid
group by sp.salespersonid,sp.salespersonname
order by avg(total_sales) desc;


--Power BI link
--https://app.powerbi.com/view?r=eyJrIjoiMWE5Y2IwYzMtYWE2ZC00ZmJiLTkwZTYtOTE0MjE3ZDg2ZGQxIiwidCI6IjMwYjNlZGY0LWYzNzEtNGU2Ni1hZTQyLWJhN2M0NTlmNDY4MSJ9

--<iframe title="Sales_Analyisis_Report" width="600" height="373.5" src="https://app.powerbi.com/view?r=eyJrIjoiMWE5Y2IwYzMtYWE2ZC00ZmJiLTkwZTYtOTE0MjE3ZDg2ZGQxIiwidCI6IjMwYjNlZGY0LWYzNzEtNGU2Ni1hZTQyLWJhN2M0NTlmNDY4MSJ9" frameborder="0" allowFullScreen="true"></iframe>
