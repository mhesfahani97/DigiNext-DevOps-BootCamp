select
    name,
    area,
    country_code2
from
    countries
where
    area between 1001449
        and 1566500 and
        name like '_%' and
        country_code2 in ('MR','ET','MN','PE')
order by
    area asc,
    name desc;
------------------------------------------------
select 
    distinct year 
from 
    country_stats 
order by year
limit 10, 5;
------------------------------------------------
select
    national_day,
    name
from
    countries
where 
    national_day is null
order by name;
------------------------------------------------
select
    g.name,
    g.guest_id,
    v.name,
    v.vip_id
from guests g
inner join vips v
    on v.name=g.name;
-----------------------------------------------
select
    g.name,
    g.guest_id,
    v.name,
    v.vip_id
from guests g
left join vips v
    on v.name=g.name;
-----------------------------------------------
select
    g.name,
    g.guest_id,
    v.name,
    v.vip_id
from guests g
right join vips v
    on v.name=g.name;
-----------------------------------------------
select
    g.name,
    g.guest_id,
    v.name,
    v.vip_id
from guests g
cross join vips v
    on v.name=g.name;
-----------------------------------------------
