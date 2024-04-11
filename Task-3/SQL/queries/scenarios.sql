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
select
    c.name country,
    r.name region,
    t.name continent
from
    countries c
inner join regions r using (region_id)
inner join continents t using (continent_id)
order by
    c.name;
-----------------------------------------------
select
    name,
    year,
    gdp
from
    countries
left join country_stats using (country_id)
where
    gdp is null
order by
    name;
-----------------------------------------------
select
    regions.name region,
    avg(area) avg_area
from
    countries
inner join regions
    using(region_id)
group by
    regions.name
order by
    avg_area desc;
-----------------------------------------------
select 
    regions.name region,
    count(country_id) country_count,
    sum(area) area
from 
    countries
inner join regions 
    using (region_id)
group by 
    (regions.name)
having 
    count(region_id) > 10 and 
    area > 1000000
order by 
    area desc,
    country_count desc;

