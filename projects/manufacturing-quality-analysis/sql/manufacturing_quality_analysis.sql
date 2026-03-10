
Manufacturing QC Analysis
-- Author: Fara
-- Tools: PostgreSQL
-- Dataset: production, defect, machine, downtime


-- 1. Create table dulu

create table machine(
machine_id TEXT primary key,
machine_name TEXT,
line TEXT
);

create table production(
production_id INT primary KEY,
date DATE,
machine_id TEXT,
product_id TEXT,
quantity_produced INT);


create table DEFECT(
defect_id INT primary KEY,
production_id INT,
defect_type TEXT,
defect_qty INT);

create table donwtime (
downtime_id INT primary KEY,
machine_id TEXT,
date DATE,
downtime_minutes INT);

-- 2. Import table ( Klik kanan di defect, downtime, machine, dan production)
/* klik kanan, import file, csv, pilih file, cek dulu di mappingnya suidah bener kah, finish
   Setelah finish klik kanan table (misal machine), view data
   Tujuan view data untuk mencek jumlah row nya benar tidak
   Tp kalau row nya terlalu banyak, caranya pakai query count aja */

-- Menghitung total row
select COUNT (*) from production;

-- Produciton trend
-- Bagaimana total produksi berubah dari hari ke hari selama 6 bulan?
select date, sum(quantity_produced) as quantity
from production group by date 
order by date;

--Machine Performance
/* Mesin mana yang menghasilkan produksi paling banyak?*/
select machine_id, SUM(quantity_produced) as total_production
from production group by machine_id
order by total_production desc;

-- Insight  : Machine M13 memiliki output produksi tertinggi

-- Defect Rate Analysis
with production_table as (select (p.product_id), SUM (coalesce((d.defect_qty),0))as total_defect, SUM(p.quantity_produced) as total_production
from production p left join defect d on p.production_id = d.production_id 
group by p.product_id)
select product_id, round((total_defect*1.0/nullif(total_production,0)*100),3) as percent_defect from production_table
order by percent_defect DESC;

--Downtime Analysis per Machine
SELECT 
    machine_id,
    SUM(downtime_minutes) AS total_downtime
FROM donwtime
GROUP BY machine_id
ORDER BY total_downtime DESC;

--Downtime + Machine Name
SELECT 
    m.machine_name,
    SUM(d.downtime_minutes) AS total_downtime
FROM donwtime d
JOIN machine m 
    ON d.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_downtime DESC;

--Downtime vs production output
SELECT 
    p.machine_id,
    SUM(p.quantity_produced) AS total_production,
    SUM(d.downtime_minutes) AS total_downtime
FROM production p
LEFT JOIN donwtime d 
    ON p.machine_id = d.machine_id
GROUP BY p.machine_id
ORDER BY total_downtime DESC;
   
--Yield  Analysis per Product
WITH production_table AS (
    SELECT 
        p.product_id,
        SUM(COALESCE(d.defect_qty,0)) AS total_defect,
        SUM(p.quantity_produced) AS total_production
    FROM production p
    LEFT JOIN defect d
        ON p.production_id = d.production_id
    GROUP BY p.product_id
)
SELECT 
    product_id,
    total_production,
    total_defect,
    ROUND(
        ((total_production - total_defect) * 1.0 /
        NULLIF(total_production,0)) * 100
    ,3) AS yield_percent
FROM production_table
ORDER BY yield_percent DESC;
