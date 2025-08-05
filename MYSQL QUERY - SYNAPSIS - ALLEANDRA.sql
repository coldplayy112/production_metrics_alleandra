use coal_mining;
select * from information_schema.columns where table_schema like '%coal_mining%';

-- MAIN
select 
p.date, 
p.mine_id,
sum(case when p.tons_extracted < 0 then 0 else p.tons_extracted end) as 'total_production_daily', 
round(avg(p.quality_grade), 2) as 'average_quality_grade'
-- count(distinct p.mine_id) as 'total_production_daily'
from production_logs p
left join mines m on m.mine_id = p.mine_id
group by p.date, p.mine_id;