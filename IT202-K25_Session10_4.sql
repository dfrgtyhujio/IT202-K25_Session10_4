create database db_ss10;
use db_ss10;

create table pharmacy_inventory (
    inventory_id int auto_increment primary key,
    drug_name varchar(255),
    batch_number varchar(50),
    expiry_date date,
    quantity int
);

-- phương án 2 index đơn

create index idx_drug_name on pharmacy_inventory(drug_name);
create index idx_expiry_date on pharmacy_inventory(expiry_date);

explain analyze
select * from pharmacy_inventory;
-- -> Table scan on pharmacy_inventory  (cost=0.35 rows=1) (actual time=0.0221..0.0221 rows=0 loops=1)
 

-- phương án composite index

create index idx_name_expiry on pharmacy_inventory(drug_name, expiry_date);

explain analyze
select * from pharmacy_inventory;
-- -> Table scan on pharmacy_inventory  (cost=0.35 rows=1) (actual time=0.0179..0.0179 rows=0 loops=1)
 