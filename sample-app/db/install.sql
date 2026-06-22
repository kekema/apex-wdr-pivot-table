-- ------- remove existing view/tables ------------
begin
    execute immediate 'drop view lib4x_sales_v';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_fact_sales purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_customer purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_product purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_subcategory purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_category purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_date purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_channel purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_salesperson purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_country purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

begin
    execute immediate 'drop table lib4x_dim_region purge';
exception
    when others then
        if sqlcode != -942 then
            raise;
        end if;
end;
/

-- -------- TABLES ----------------
create table lib4x_dim_region (
    region_id      number generated always as identity primary key,
    region_name    varchar2(100) not null unique
);

create table lib4x_dim_country (
    country_id     number generated always as identity primary key,
    country_name   varchar2(100) not null unique,
    region_id      number not null
        references lib4x_dim_region(region_id)
);

create table lib4x_dim_customer (
    customer_id        number generated always as identity primary key,

    customer_name      varchar2(200) not null unique,

    customer_segment   varchar2(50),

    country_id         number not null
        references lib4x_dim_country(country_id)
);

create table lib4x_dim_category (
    category_id      number generated always as identity primary key,
    category_name    varchar2(100) not null unique
);

create table lib4x_dim_subcategory (
    subcategory_id    number generated always as identity primary key,

    category_id       number not null
        references lib4x_dim_category(category_id),

    subcategory_name  varchar2(100) not null,

    constraint uk_lib4x_dim_subcategory
        unique(category_id, subcategory_name)
);

create table lib4x_dim_product (
    product_id        number generated always as identity primary key,

    product_name      varchar2(200) not null unique,

    subcategory_id    number not null
        references lib4x_dim_subcategory(subcategory_id),

    list_price        number(10,2)
);

create table lib4x_dim_salesperson (
    salesperson_id    number generated always as identity primary key,

    salesperson_name  varchar2(200) not null unique,

    sales_level       varchar2(30),
	
    country_id         number not null
        references lib4x_dim_country(country_id)
);

create table lib4x_dim_channel (
    channel_id       number generated always as identity primary key,

    channel_name     varchar2(50) not null unique
);

create table lib4x_dim_date (
    date_id          date primary key,

    day_of_month     number,
    day_name         varchar2(20),

    month_num        number,
    month_name       varchar2(20),

    quarter_num      number,
    quarter_name     varchar2(20),

    year_num         number,

    week_num         number,

    is_weekend       varchar2(1)
);

create table lib4x_fact_sales (
    sales_id           number generated always as identity primary key,

    order_id           varchar2(50) not null,
    order_line_id      number not null,

    date_id            date not null
        references lib4x_dim_date(date_id),

    customer_id        number not null
        references lib4x_dim_customer(customer_id),

    product_id         number not null
        references lib4x_dim_product(product_id),

    salesperson_id     number not null
        references lib4x_dim_salesperson(salesperson_id),

    channel_id         number not null
        references lib4x_dim_channel(channel_id),

    quantity           number not null,

    unit_price         number(10,2),

    discount_amount    number(10,2),

    sales_amount       number(12,2),

    profit_amount      number(12,2)
);

create index ix_lib4x_fact_sales_date
    on lib4x_fact_sales(date_id);

create index ix_lib4x_fact_sales_customer
    on lib4x_fact_sales(customer_id);

create index ix_lib4x_fact_sales_product
    on lib4x_fact_sales(product_id);

create index ix_lib4x_fact_sales_salesperson
    on lib4x_fact_sales(salesperson_id);

create index ix_lib4x_fact_sales_channel
    on lib4x_fact_sales(channel_id);

-- ---------- lib4x_dim_date -----------

begin
    insert into lib4x_dim_date (
        date_id,
        day_of_month,
        day_name,
        month_num,
        month_name,
        quarter_num,
        quarter_name,
        year_num,
        week_num,
        is_weekend
    )
    with dates as (
        select date '2024-01-01' + level - 1 as dt
        from dual
        connect by level <= (
            date '2025-12-31' - date '2024-01-01' + 1
        )
    )
    select
        dt,
        extract(day from dt),
        trim(to_char(dt, 'DAY', 'NLS_DATE_LANGUAGE=ENGLISH')),
        extract(month from dt),
        trim(to_char(dt, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH')),
        to_number(to_char(dt, 'Q')),
        'Quarter ' || to_char(dt, 'Q'),
        extract(year from dt),
        to_number(to_char(dt, 'IW')),
        case
            when to_char(dt, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
                 in ('SAT', 'SUN')
            then 'Y'
            else 'N'
        end
    from dates;

    commit;
end;
/

-- ------------------ lib4x_dim_region ----------

begin
	insert into lib4x_dim_region (region_name) values ('Europe');
	insert into lib4x_dim_region (region_name) values ('North America');
	insert into lib4x_dim_region (region_name) values ('Asia-Pacific');
	commit;
end;
/

-- --------------- lib4x_dim_country ---------

begin
	insert into lib4x_dim_country (country_name, region_id)
	select 'United Kingdom', region_id
	from lib4x_dim_region
	where region_name = 'Europe';

	insert into lib4x_dim_country (country_name, region_id)
	select 'France', region_id
	from lib4x_dim_region
	where region_name = 'Europe';

	insert into lib4x_dim_country (country_name, region_id)
	select 'Germany', region_id
	from lib4x_dim_region
	where region_name = 'Europe';

	insert into lib4x_dim_country (country_name, region_id)
	select 'Spain', region_id
	from lib4x_dim_region
	where region_name = 'Europe';


	insert into lib4x_dim_country (country_name, region_id)
	select 'United States', region_id
	from lib4x_dim_region
	where region_name = 'North America';

	insert into lib4x_dim_country (country_name, region_id)
	select 'Canada', region_id
	from lib4x_dim_region
	where region_name = 'North America';


	insert into lib4x_dim_country (country_name, region_id)
	select 'Japan', region_id
	from lib4x_dim_region
	where region_name = 'Asia-Pacific';

	insert into lib4x_dim_country (country_name, region_id)
	select 'Singapore', region_id
	from lib4x_dim_region
	where region_name = 'Asia-Pacific';

	insert into lib4x_dim_country (country_name, region_id)
	select 'Australia', region_id
	from lib4x_dim_region
	where region_name = 'Asia-Pacific';

	insert into lib4x_dim_country (country_name, region_id)
	select 'New Zealand', region_id
	from lib4x_dim_region
	where region_name = 'Asia-Pacific';

	commit;
end;
/

-- ---------------- lib4x_dim_category -------------

begin
	insert into lib4x_dim_category (category_name) values ('Hardware');
	insert into lib4x_dim_category (category_name) values ('Mobile Devices');
	insert into lib4x_dim_category (category_name) values ('Networking and Infrastructure');
	insert into lib4x_dim_category (category_name) values ('Software');
	insert into lib4x_dim_category (category_name) values ('Consumer Electronics');
	commit;
end;
/

-- ------------- lib4x_dim_subcategory --------
-- Hardware

begin
	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Laptops' from lib4x_dim_category where category_name = 'Hardware';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Desktops' from lib4x_dim_category where category_name = 'Hardware';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Servers' from lib4x_dim_category where category_name = 'Hardware';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Tablets' from lib4x_dim_category where category_name = 'Hardware';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Workstations' from lib4x_dim_category where category_name = 'Hardware';


	-- Mobile Devices
	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Smartphones' from lib4x_dim_category where category_name = 'Mobile Devices';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Smartwatches' from lib4x_dim_category where category_name = 'Mobile Devices';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Earbuds' from lib4x_dim_category where category_name = 'Mobile Devices';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Accessories' from lib4x_dim_category where category_name = 'Mobile Devices';


	-- Networking and Infrastructure
	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Routers' from lib4x_dim_category where category_name = 'Networking and Infrastructure';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Switches' from lib4x_dim_category where category_name = 'Networking and Infrastructure';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Firewalls' from lib4x_dim_category where category_name = 'Networking and Infrastructure';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Access Points' from lib4x_dim_category where category_name = 'Networking and Infrastructure';


	-- Software
	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Operating Systems' from lib4x_dim_category where category_name = 'Software';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Productivity' from lib4x_dim_category where category_name = 'Software';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Databases' from lib4x_dim_category where category_name = 'Software';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Security Software' from lib4x_dim_category where category_name = 'Software';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Developer Tools' from lib4x_dim_category where category_name = 'Software';


	-- Consumer Electronics
	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Televisions' from lib4x_dim_category where category_name = 'Consumer Electronics';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Audio Systems' from lib4x_dim_category where category_name = 'Consumer Electronics';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Gaming Consoles' from lib4x_dim_category where category_name = 'Consumer Electronics';

	insert into lib4x_dim_subcategory (category_id, subcategory_name)
	select category_id, 'Smart Home' from lib4x_dim_category where category_name = 'Consumer Electronics';

	commit;
end;
/
-- ------------ lib4x_dim_product ------
-- =========================
-- Laptops
-- =========================

begin
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	select 'Dell XPS 13', subcategory_id, 1400 from lib4x_dim_subcategory where subcategory_name = 'Laptops';

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Lenovo ThinkPad X1 Carbon',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Laptops'),
			1600);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('HP Spectre x360',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Laptops'),
			1500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('MacBook Air M3',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Laptops'),
			1700);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Asus ZenBook 14',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Laptops'),
			1300);

	-- =========================
	-- Desktops
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Dell OptiPlex 7000',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Desktops'),
			1100);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('HP ProDesk 600',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Desktops'),
			1000);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Lenovo ThinkCentre M80',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Desktops'),
			1050);

	-- =========================
	-- Servers
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Dell PowerEdge R760',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Servers'),
			8000);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('HPE ProLiant DL380',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Servers'),
			7500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Lenovo ThinkSystem SR650',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Servers'),
			7800);

	-- =========================
	-- Tablets
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('iPad Air',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Tablets'),
			900);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Samsung Galaxy Tab S9',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Tablets'),
			850);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Microsoft Surface Pro',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Tablets'),
			1200);

	-- =========================
	-- Smartphones
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('iPhone 15 Pro',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smartphones'),
			1200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Samsung Galaxy S24',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smartphones'),
			1100);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Google Pixel 9',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smartphones'),
			900);

	-- =========================
	-- Smartwatches
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Apple Watch Series 9',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smartwatches'),
			500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Samsung Galaxy Watch 6',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smartwatches'),
			400);

	-- =========================
	-- Networking
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Cisco Catalyst 9300',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Switches'),
			3500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Ubiquiti UniFi AP',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Access Points'),
			200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Fortinet FortiGate 100F',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Firewalls'),
			2500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('TP-Link Archer AX73',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Routers'),
			180);

	-- =========================
	-- Software
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Microsoft 365 Business',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Productivity'),
			120);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Oracle Database License',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Databases'),
			5000);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Windows Server 2025',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Operating Systems'),
			900);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('JetBrains IntelliJ IDEA',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Developer Tools'),
			250);

	-- =========================
	-- Consumer Electronics
	-- =========================
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Sony Bravia 65inch',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Televisions'),
			1400);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Sony WH-1000XM5',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Audio Systems'),
			350);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('PlayStation 5',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Gaming Consoles'),
			550);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Philips Hue Starter Kit',
			(select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smart Home'),
			200);
			
	-- =========================
	-- Workstations
	-- =========================		
			
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Dell Precision 5860',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Workstations'),
	 2800);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('HP Z4 G5 Workstation',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Workstations'),
	 2600);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)
	values ('Lenovo ThinkStation P5',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Workstations'),
	 3000);		
	 
	-- =========================
	-- Earbuds
	-- =========================	 
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Apple AirPods Pro 2',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Earbuds'), 280);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Samsung Galaxy Buds2 Pro',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Earbuds'), 220);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Sony WF-1000XM5',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Earbuds'), 250); 
	 
	-- =========================
	-- Accessories
	-- =========================	 
	 
	 insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Logitech MX Master 3S Mouse',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Accessories'), 120);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Keychron K8 Mechanical Keyboard',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Accessories'), 110);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Anker USB-C Hub 7-in-1',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Accessories'), 60);
	 
	-- =========================
	-- Routers
	-- =========================

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('ASUS RT-AX88U Pro',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Routers'), 320);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Netgear Nighthawk AX5400',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Routers'), 280);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('TP-Link Deco X60 Mesh',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Routers'), 240); 
	 
	-- =========================
	-- Switches
	-- ========================= 
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Cisco Catalyst 9200',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Switches'), 1800);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Netgear GS728TP',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Switches'), 600);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Ubiquiti UniFi Switch 24',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Switches'), 450); 
	 
	-- =========================
	-- Firewalls
	-- ========================= 

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Fortinet FortiGate 60F',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Firewalls'), 900);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Palo Alto PA-410',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Firewalls'), 2200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Sophos XGS 87',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Firewalls'), 1200); 
	 
	-- =========================
	-- Access Points
	-- ========================= 
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Ubiquiti UniFi 6 Lite',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Access Points'), 130);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Cisco Aironet 1830',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Access Points'), 450);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('TP-Link EAP660 HD',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Access Points'), 200); 

	-- =========================
	-- Operating Systems
	-- =========================  
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Windows 11 Pro License',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Operating Systems'), 200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Ubuntu Enterprise Support',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Operating Systems'), 150);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Red Hat Enterprise Linux',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Operating Systems'), 350); 
	 
	-- =========================
	-- Productivity
	-- =========================  

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Microsoft 365 E3',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Productivity'), 180);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Google Workspace Business',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Productivity'), 150);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price) values ('Notion Enterprise',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Productivity'), 120);

	-- =========================
	-- Databases
	-- =========================   
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Oracle Database Enterprise Edition',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Databases'), 12000);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Microsoft SQL Server Standard',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Databases'), 7000);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('PostgreSQL Enterprise Support',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Databases'), 2500); 
	 
	-- =========================
	-- Security Software
	-- =========================  

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('CrowdStrike Falcon',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Security Software'), 600);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Symantec Endpoint Protection',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Security Software'), 400);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Bitdefender GravityZone',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Security Software'), 350); 
	 
	-- =========================
	-- Developer Tools
	-- =========================  
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Visual Studio Enterprise',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Developer Tools'), 500);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('GitHub Enterprise',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Developer Tools'), 240);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Docker Business',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Developer Tools'), 180);
	 
	-- =========================
	-- Televisions
	-- =========================  

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('LG OLED C3 65inch',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Televisions'), 1800);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Samsung Neo QLED 75inch',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Televisions'), 2200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Sony Bravia XR 55inch',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Televisions'), 1500); 
	 
	-- =========================
	-- Audio Systems
	-- =========================   
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Sonos Arc Soundbar',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Audio Systems'), 900);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Bose Lifestyle 600',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Audio Systems'), 1200);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Sony HT-A7000',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Audio Systems'), 1100); 

	-- =========================
	-- Gaming Consoles
	-- =========================    
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Xbox Series X',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Gaming Consoles'), 550);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Nintendo Switch OLED',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Gaming Consoles'), 350);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Steam Deck',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Gaming Consoles'), 650); 
	 
	-- =========================
	-- Smart Home
	-- =========================   
	 
	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Philips Hue Bridge Kit',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smart Home'), 120);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Google Nest Hub',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smart Home'), 150);

	insert into lib4x_dim_product (product_name, subcategory_id, list_price)  values ('Amazon Echo Show 10',
	 (select subcategory_id from lib4x_dim_subcategory where subcategory_name = 'Smart Home'), 200); 
	 
	commit;
end;
/
-- ------------ lib4x_dim_channel--------
begin
	insert into lib4x_dim_channel (channel_name) values ('Online');
	insert into lib4x_dim_channel (channel_name) values ('Partner / Reseller');
	insert into lib4x_dim_channel (channel_name) values ('Direct Sales');
	insert into lib4x_dim_channel (channel_name) values ('Marketplace');
	commit;
end;
/

-- ------------ lib4x_dim_customer ----------------

begin
	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)  values ('BT Group', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United Kingdom')); 
	 
	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Tesco Technology', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'United Kingdom'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Barclays Digital Services', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United Kingdom'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('London TechWorks Ltd', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'United Kingdom'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Brightbyte Solutions UK', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'United Kingdom'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Orange Business Services', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'France'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('BNP Paribas IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'France'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Carrefour Digital', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'France'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Capgemini Consulting', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'France'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('HexaTech Paris', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'France'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Siemens Digital Industries', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Germany'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Deutsche Telekom IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Germany'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('BMW ConnectedDrive', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Germany'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('SAP Consulting GmbH', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Germany'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Munich Data Systems', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Germany'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Telefónica Tech', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Spain'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Banco Santander IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Spain'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Indra Sistemas', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Spain'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('El Corte Inglés Digital', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Spain'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Madrid CloudWorks', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Spain'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Amazon Corporate IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United States'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Microsoft Enterprise Division', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United States'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Google Cloud Operations', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United States'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('IBM Systems USA', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'United States'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Acme Digital Solutions Inc', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'United States'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('RBC Digital Banking', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Canada'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Shopify Engineering', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Canada'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Bell Canada IT Services', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Canada'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Toronto Cloud Systems', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Canada'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('MapleTech Solutions', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Canada'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Toyota IT Services', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Japan'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Sony Digital Systems', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Japan'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('SoftBank Technology', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Japan'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Hitachi Solutions', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Japan'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Tokyo NexTech Corp', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Japan'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('DBS Bank Technology', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Singapore'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('SingTel Digital', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Singapore'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('GovTech Singapore', 'Public Sector',
	 (select country_id from lib4x_dim_country where country_name = 'Singapore'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Sea Group Engineering', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Singapore'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('AsiaCloud Systems', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Singapore'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Commonwealth Bank IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Australia'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Telstra Digital Services', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'Australia'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Woolworths Technology', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'Australia'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Sydney Data Systems', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Australia'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('AussieCloud Pty Ltd', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'Australia'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('ANZ New Zealand IT', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'New Zealand'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Spark Digital', 'Enterprise',
	 (select country_id from lib4x_dim_country where country_name = 'New Zealand'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Fonterra Systems', 'Mid-Market',
	 (select country_id from lib4x_dim_country where country_name = 'New Zealand'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('Wellington Tech Group', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'New Zealand'));

	insert into lib4x_dim_customer (customer_name, customer_segment, country_id)
	values ('KiwiCloud Solutions', 'SMB',
	 (select country_id from lib4x_dim_country where country_name = 'New Zealand'));
	 
	commit;
end;
/

-- --------- lib4x_dim_salesperson -------- 

begin
	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level)
	values ('Oliver Bennett', (select country_id from lib4x_dim_country where country_name='United Kingdom'), 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Emily Carter',
	 (select country_id from lib4x_dim_country where country_name='United Kingdom'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('James Whitmore',
	 (select country_id from lib4x_dim_country where country_name='United Kingdom'),
	 'Sales Representative');
	 
	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Jean Moreau',
	 (select country_id from lib4x_dim_country where country_name='France'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Claire Dubois',
	 (select country_id from lib4x_dim_country where country_name='France'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Luc Martin',
	 (select country_id from lib4x_dim_country where country_name='France'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Anna Schneider',
	 (select country_id from lib4x_dim_country where country_name='Germany'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Thomas Müller',
	 (select country_id from lib4x_dim_country where country_name='Germany'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Felix Weber',
	 (select country_id from lib4x_dim_country where country_name='Germany'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Carlos García',
	 (select country_id from lib4x_dim_country where country_name='Spain'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('María López',
	 (select country_id from lib4x_dim_country where country_name='Spain'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Javier Ruiz',
	 (select country_id from lib4x_dim_country where country_name='Spain'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Michael Johnson',
	 (select country_id from lib4x_dim_country where country_name='United States'),
	 'Sales Director');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Sarah Williams',
	 (select country_id from lib4x_dim_country where country_name='United States'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('David Miller',
	 (select country_id from lib4x_dim_country where country_name='United States'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Jessica Brown',
	 (select country_id from lib4x_dim_country where country_name='United States'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Emma Wilson',
	 (select country_id from lib4x_dim_country where country_name='Canada'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Noah Taylor',
	 (select country_id from lib4x_dim_country where country_name='Canada'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Liam Scott',
	 (select country_id from lib4x_dim_country where country_name='Canada'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Hiroshi Tanaka',
	 (select country_id from lib4x_dim_country where country_name='Japan'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Yuki Nakamura',
	 (select country_id from lib4x_dim_country where country_name='Japan'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Kenji Sato',
	 (select country_id from lib4x_dim_country where country_name='Japan'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Aiden Lim',
	 (select country_id from lib4x_dim_country where country_name='Singapore'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Siti Rahman',
	 (select country_id from lib4x_dim_country where country_name='Singapore'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Daniel Tan',
	 (select country_id from lib4x_dim_country where country_name='Singapore'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Jack Thompson',
	 (select country_id from lib4x_dim_country where country_name='Australia'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Olivia Harris',
	 (select country_id from lib4x_dim_country where country_name='Australia'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Ethan Walker',
	 (select country_id from lib4x_dim_country where country_name='Australia'),
	 'Sales Representative');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Lucas King',
	 (select country_id from lib4x_dim_country where country_name='New Zealand'),
	 'Account Manager');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Mia Thompson',
	 (select country_id from lib4x_dim_country where country_name='New Zealand'),
	 'Senior Sales Rep');

	insert into lib4x_dim_salesperson (salesperson_name, country_id, sales_level) values ('Noah Brown',
	 (select country_id from lib4x_dim_country where country_name='New Zealand'),
	 'Sales Representative');

	commit;
end;
/

-- --------- LIB4X_FACT_SALES demo data generation ----
declare
    c_orders constant pls_integer := 1750;		-- number of orders to generate

    l_order_id         varchar2(50);
    l_order_date       date;

    l_customer_id      lib4x_dim_customer.customer_id%type;
    l_customer_segment lib4x_dim_customer.customer_segment%type;
    l_country_id       lib4x_dim_customer.country_id%type;

    l_salesperson_id   lib4x_dim_salesperson.salesperson_id%type;
    l_channel_id       lib4x_dim_channel.channel_id%type;

    l_product_id       lib4x_dim_product.product_id%type;
    l_list_price       lib4x_dim_product.list_price%type;
    l_category_name    lib4x_dim_category.category_name%type;

    l_line_count       pls_integer;

    l_quantity         number;
    l_unit_price       number(10,2);

    l_discount_pct     number;
    l_discount_amount  number(10,2);

    l_sales_amount     number(12,2);
    l_profit_amount    number(12,2);

    l_margin_pct       number;
begin

    dbms_random.seed(42);

    for o in 1 .. c_orders loop

        l_order_id :=
            'ORD-' || to_char(o, 'FM000000');

        ----------------------------------------------------------------
        -- DATE (Q4 weighted)
        ----------------------------------------------------------------

		declare
			l_quarter number;
			r number;
		begin

			r := dbms_random.value(0,100);

			if r < 20 then
				l_quarter := 1;
			elsif r < 42 then
				l_quarter := 2;
			elsif r < 65 then
				l_quarter := 3;
			else
				l_quarter := 4;
			end if;
			
			select date_id
			into l_order_date
			from (
				select date_id
				from lib4x_dim_date
				where quarter_num = l_quarter
				order by dbms_random.value
			)
			fetch first 1 row only;
		end;

        ----------------------------------------------------------------
        -- CUSTOMER
        ----------------------------------------------------------------

        select customer_id,
               customer_segment,
               country_id
        into l_customer_id,
             l_customer_segment,
             l_country_id
        from (
            select customer_id,
                   customer_segment,
                   country_id
            from lib4x_dim_customer
            order by dbms_random.value
        )
        fetch first 1 row only;

        ----------------------------------------------------------------
        -- CHANNEL BASED ON CUSTOMER TYPE
        ----------------------------------------------------------------

        declare
            r number := dbms_random.value(0,100);
        begin

            if l_customer_segment = 'Enterprise' then

                if r < 50 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Direct Sales';

                elsif r < 85 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Partner / Reseller';

                elsif r < 95 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Online';

                else
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Marketplace';
                end if;

            elsif l_customer_segment = 'Public Sector' then

                if r < 60 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Partner / Reseller';
                else
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Direct Sales';
                end if;

            elsif l_customer_segment = 'SMB' then

                if r < 40 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Online';

                elsif r < 70 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Marketplace';

                elsif r < 90 then
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Partner / Reseller';

                else
                    select channel_id into l_channel_id
                    from lib4x_dim_channel
                    where channel_name = 'Direct Sales';
                end if;

            else

                select channel_id
                into l_channel_id
                from (
                    select channel_id
                    from lib4x_dim_channel
                    order by dbms_random.value
                )
                fetch first 1 row only;

            end if;

        end;

        ----------------------------------------------------------------
        -- SALESPERSON FROM SAME COUNTRY
        ----------------------------------------------------------------

        select salesperson_id
        into l_salesperson_id
        from (
            select salesperson_id
            from lib4x_dim_salesperson
            where country_id = l_country_id
            order by dbms_random.value
        )
        fetch first 1 row only;

        ----------------------------------------------------------------
        -- ORDER LINES
        ----------------------------------------------------------------

        l_line_count :=
            trunc(dbms_random.value(1,4));

        for line_no in 1 .. l_line_count loop

            ------------------------------------------------------------
            -- PRODUCT
            ------------------------------------------------------------

			declare
				l_category_filter varchar2(200);
			begin

				case l_customer_segment

					when 'Enterprise' then
						l_category_filter :=
							'Hardware,Networking and Infrastructure,Software';

					when 'Mid-Market' then
						l_category_filter :=
							'Hardware,Software,Mobile Devices';

					when 'SMB' then
						l_category_filter :=
							'Hardware,Mobile Devices,Software';

					when 'Public Sector' then
						l_category_filter :=
							'Hardware,Networking and Infrastructure,Software';

					when 'Consumer' then
						l_category_filter :=
							'Consumer Electronics,Mobile Devices';

					else
						l_category_filter :=
							'Hardware,Software';
				end case;

				select product_id,
					   list_price,
					   category_name
				into l_product_id,
					 l_list_price,
					 l_category_name
				from (
					select p.product_id,
						   p.list_price,
						   c.category_name
					from lib4x_dim_product p
					join lib4x_dim_subcategory s
					  on s.subcategory_id = p.subcategory_id
					join lib4x_dim_category c
					  on c.category_id = s.category_id
					where instr(
							  ',' || l_category_filter || ',',
							  ',' || c.category_name || ','
						  ) > 0
					order by dbms_random.value
				)
				fetch first 1 row only;

			end;

            ------------------------------------------------------------
            -- QUANTITY
            ------------------------------------------------------------

            l_quantity :=
                case l_customer_segment
                    when 'Enterprise'
                        then trunc(dbms_random.value(5,30))

                    when 'Mid-Market'
                        then trunc(dbms_random.value(3,20))

                    when 'Public Sector'
                        then trunc(dbms_random.value(10,100))

                    when 'SMB'
                        then trunc(dbms_random.value(1,10))

                    else
                        trunc(dbms_random.value(1,3))
                end;

            ------------------------------------------------------------
            -- DISCOUNT
            ------------------------------------------------------------

            l_discount_pct :=
                case l_customer_segment
                    when 'Enterprise'
                        then dbms_random.value(0.05,0.15)

                    when 'Mid-Market'
                        then dbms_random.value(0.03,0.10)

                    when 'Public Sector'
                        then dbms_random.value(0.10,0.20)

                    when 'SMB'
                        then dbms_random.value(0,0.05)

                    else
                        dbms_random.value(0,0.03)
                end;

            ------------------------------------------------------------
            -- MARGIN
            ------------------------------------------------------------

            l_margin_pct :=
                case l_category_name

                    when 'Software'
                        then 0.70

                    when 'Networking and Infrastructure'
                        then 0.35

                    when 'Hardware'
                        then 0.22

                    when 'Mobile Devices'
                        then 0.18

                    when 'Consumer Electronics'
                        then 0.15

                    else
                        0.20
                end;

            ------------------------------------------------------------
            -- CALCULATIONS
            ------------------------------------------------------------

            l_unit_price :=
                l_list_price;

            l_discount_amount :=
                round(
                    l_quantity *
                    l_unit_price *
                    l_discount_pct,
                    2
                );

            l_sales_amount :=
                round(
                    (l_quantity * l_unit_price)
                    - l_discount_amount,
                    2
                );

            l_profit_amount :=
                round(
                    l_sales_amount * l_margin_pct,
                    2
                );

            ------------------------------------------------------------
            -- INSERT
            ------------------------------------------------------------

            insert into lib4x_fact_sales (
                order_id,
                order_line_id,
                date_id,
                customer_id,
                product_id,
                salesperson_id,
                channel_id,
                quantity,
                unit_price,
                discount_amount,
                sales_amount,
                profit_amount
            )
            values (
                l_order_id,
                line_no,
                l_order_date,
                l_customer_id,
                l_product_id,
                l_salesperson_id,
                l_channel_id,
                l_quantity,
                l_unit_price,
                l_discount_amount,
                l_sales_amount,
                l_profit_amount
            );

        end loop;

        if mod(o,100)=0 then
            commit;
        end if;

    end loop;

    commit;

end;
/
 
-- --------------- lib4x_sales_v view ---------------

create or replace view lib4x_sales_v as
select
	f.sales_id,
    c.customer_name as customer,
    c.customer_segment as "SEGMENT",
    co.country_name as country,
    re.region_name as region,
    p.product_name as product,
    cat.category_name as category,	
    subcat.subcategory_name as subcategory,
	ch.channel_name as channel,
	sp.salesperson_name as sales_rep,
	sp.sales_level,
	f.date_id as order_date,
	f.order_id as "ORDER",
	f.order_line_id as order_line,
    f.quantity,
	f.unit_price,
    f.discount_amount,	
    f.sales_amount,
    f.profit_amount
from lib4x_fact_sales f
join lib4x_dim_customer c
    on c.customer_id = f.customer_id
join lib4x_dim_country co
    on co.country_id = c.country_id
join lib4x_dim_region re
    on re.region_id = co.region_id	
join lib4x_dim_product p
    on p.product_id = f.product_id
join lib4x_dim_subcategory subcat
    on subcat.subcategory_id = p.subcategory_id
join lib4x_dim_category cat
    on cat.category_id = subcat.category_id
join lib4x_dim_channel ch
    on ch.channel_id = f.channel_id
join lib4x_dim_salesperson sp
    on sp.salesperson_id = f.salesperson_id;
	
-- --------------- LIB4X_PIVOT_TABLE package ------------

create or replace package "LIB4X_PIVOT_TABLE" as

function p2_get_pivot_query_a return varchar2;

function p2_get_pivot_query_b return varchar2;

function p2_get_chart_query(p_filters_page_item in varchar2) return varchar2;

function p2_get_report_query(p_filters_page_item in varchar2) return varchar2;

end "LIB4X_PIVOT_TABLE";
/

-- ------------- LIB4X_PIVOT_TABLE package body --------

create or replace package body "LIB4X_PIVOT_TABLE" as
  
  function p2_get_condition_part(p_filter_name varchar2, p_member varchar2) return varchar2
  is
    l_condition_part          varchar2(1000);
    l_value                   varchar2(100);
    
    function get_period_condition_part(p_filter_name varchar2, p_member varchar2) return varchar2
    is
      l_condition_part          varchar2(1000);
      l_value                   varchar2(100);      
      l_format                  varchar2(20);        
    begin
      l_value := UPPER(substr(p_member, instr(p_member, '.', -1) + 1));  
      l_format := case p_filter_name when 'PERIOD.Year' then 'YYYY' when 'PERIOD.Month' then 'MM' when 'PERIOD.Day' then 'DD' end;
      l_condition_part := 'to_char(order_date, ''' || l_format || ''') = ''' || l_value || '''';
      return l_condition_part;
    end get_period_condition_part;   
    
    function get_product_condition_part(p_member varchar2) return varchar2
    is
      l_condition_part          varchar2(1000);
      l_value                   varchar2(100);
      l_field                   varchar2(100);
    begin
      for l_member_part_idx in 2 .. regexp_count(p_member, '\.') + 1 loop
          l_value := regexp_substr(p_member, '[^.]+', 1, l_member_part_idx);
          l_field := case l_member_part_idx when 2 then 'CATEGORY' when 3 then 'SUBCATEGORY' when 4 then 'PRODUCT' end;
          if l_member_part_idx > 2 then
            l_condition_part := l_condition_part || ' and ';
          end if;
          l_condition_part := l_condition_part || l_field || ' = ''' || l_value || '''';
      end loop;
      return l_condition_part;
    end get_product_condition_part;    
    
    function get_year_condition_part(p_member varchar2) return varchar2
    is
      l_condition_part          varchar2(1000);
      l_value                   varchar2(100);
    begin
      l_value := substr(p_member, instr(p_member, '.', -1) + 1);
      l_condition_part := 'to_char(order_date, ''YYYY'') = ''' || l_value || '''';
      return l_condition_part;
    end get_year_condition_part;
    
    function get_quarter_condition_part(p_member varchar2) return varchar2
    is
      l_condition_part          varchar2(1000);
      l_value                   varchar2(100);
    begin
      l_value := substr(p_member, instr(p_member, '.', -1) + 1);
      l_condition_part := '''Q'' || to_char(order_date, ''Q'') = ''' || l_value || '''';
      return l_condition_part;
    end get_quarter_condition_part;    
    
  begin
    if (p_filter_name = 'PERIOD.Year' or p_filter_name = 'PERIOD.Month' or p_filter_name = 'PERIOD.Day') then
      l_condition_part := get_period_condition_part(p_filter_name, p_member);
    elsif p_filter_name = 'Product by Category' then
      l_condition_part := get_product_condition_part(p_member);
    elsif p_filter_name = 'YEAR' then
      l_condition_part := get_year_condition_part(p_member);
    elsif p_filter_name = 'QUARTER' then
      l_condition_part := get_quarter_condition_part(p_member);      
    end if;
    return l_condition_part;      
  end p2_get_condition_part;  
  
  /* Generic function */
  function get_condition(p_filters_page_item in varchar2, p_excl_filters in varchar2 default null) return varchar2
  is
    l_condition                 varchar2(32767) := '';
    l_filters                   varchar2(32676);
    l_filters_arr               json_array_t;
    l_filters_arr_idx           pls_integer;  
    l_filter_obj                json_object_t;
    l_filter_name               varchar2(30);
    l_members                   json_array_t;
    l_member                    varchar2(1000);
    l_members_arr_idx           pls_integer;      
    l_condition_part            varchar2(1000);
    l_value                     varchar2(100);    
    
  begin
    l_filters := v(p_filters_page_item);
    if (l_filters is not null) then
      l_filters_arr := json_array_t.parse(l_filters);
      for l_filters_arr_idx in 0 .. l_filters_arr.get_size - 1 loop
        l_filter_obj := TREAT (l_filters_arr.get(l_filters_arr_idx) AS json_object_t);
        l_filter_name := l_filter_obj.get_String('name');
        if (p_excl_filters is null) or (instr(',' || replace(p_excl_filters, ' ') || ',', ',' || l_filter_name || ',') <= 0) then
          l_condition := l_condition || ' and ';
          if l_filter_obj.get_Boolean('negation') then
            l_condition := l_condition || 'not ';
          end if;
          l_condition := l_condition || '(';
          l_members := l_filter_obj.get_Array('members');
          for l_members_arr_idx in 0 .. l_members.get_size - 1 loop
            if l_members_arr_idx > 0 then
              l_condition := l_condition || ' or ';
            end if;
            l_member := l_members.get_string(l_members_arr_idx);
            case v('APP_PAGE_ID')
              when '2' then l_condition_part := p2_get_condition_part(l_filter_name, l_member);
            end case;
            if l_condition_part is null then
              -- default situation: dimension = value
              l_value := substr(l_member, instr(l_member, '.', -1) + 1);
              l_condition_part := l_filter_name || ' = ''' || l_value || '''';         
            end if;
            l_condition := l_condition || l_condition_part;           
          end loop;
          l_condition := l_condition || ')';
        end if;
      end loop;
    end if;
    return l_condition;
  end get_condition;

  function p2_get_pivot_query_a return varchar2
  is
  begin
    return q'~
    SELECT  category,
            country,
            region,		 
            "SEGMENT",
            channel,
            sales_rep,
            sales_level,
            TO_CHAR(order_date, 'YYYY') as year,
            'Q' || TO_CHAR(order_date, 'Q') as quarter,
            SUM(sales_amount) as revenue,
            SUM(profit_amount) as profit,
            COUNT(sales_id) as transaction_count
    FROM lib4x_sales_v
    GROUP BY
            category,
            country,
            region,		 
            "SEGMENT",
            channel,  
            sales_rep,
            sales_level,            
            TO_CHAR(order_date, 'YYYY'),
            'Q' || TO_CHAR(order_date, 'Q')
    ~';
  end p2_get_pivot_query_a;  
  
  function p2_get_pivot_query_b return varchar2
  is
  begin
    return q'~
    SELECT 
            category,
            subcategory,
            product,
            TO_CHAR(order_date, 'YYYY-MM') as period,
            SUM(sales_amount) as revenue,
            SUM(profit_amount) as profit,
            COUNT(sales_id) as transaction_count
    FROM lib4x_sales_v
    GROUP BY
            category,
            subcategory,
            product,           
            TO_CHAR(order_date, 'YYYY-MM')
    ~';
  end p2_get_pivot_query_b;    
  
  function p2_get_report_query(p_filters_page_item in varchar2) return varchar2
  is
    result_query varchar2(4000);  
  begin
    result_query := q'~
        select *
          from LIB4X_SALES_V
          where (1=1)
        ~' || get_condition(p_filters_page_item);
   
    return result_query;
  end p2_get_report_query;  
  
  function p2_get_chart_query(p_filters_page_item in varchar2) return varchar2
  is
    sales_query varchar2(32676);
  begin
    sales_query := q'~
      WITH bounds AS (
          SELECT
              TRUNC(MIN(order_date), 'YYYY') min_period,
              ADD_MONTHS(TRUNC(MAX(order_date), 'YYYY'), 11) max_period
          FROM lib4x_sales_v
          WHERE (1=1) ~' || get_condition(p_filters_page_item, 'PERIOD.Month, PERIOD.Day') || q'~
      ),
      months AS (
          SELECT ADD_MONTHS(b.min_period, LEVEL - 1) period
          FROM bounds b
          CONNECT BY LEVEL <= MONTHS_BETWEEN(
                                  b.max_period,
                                  b.min_period
                              ) + 1
      ),
      sales AS (
          SELECT
              TRUNC(order_date, 'MM') period,
              SUM(sales_amount) revenue,
              SUM(profit_amount) profit,
              COUNT(sales_id) transaction_count
          FROM lib4x_sales_v
          WHERE (1=1) ~' || get_condition(p_filters_page_item, 'PERIOD.Month, PERIOD.Day') || q'~
          GROUP BY TRUNC(order_date, 'MM')
      )
      SELECT
          m.period,
          NVL(s.revenue, 0) revenue,
          NVL(s.profit, 0) profit,
          NVL(s.transaction_count, 0) transaction_count
      FROM months m
      LEFT JOIN sales s
          ON s.period = m.period
      ORDER BY m.period
    ~';
    return sales_query;
  end p2_get_chart_query; 
  
end "LIB4X_PIVOT_TABLE";
/

-- -------------------
