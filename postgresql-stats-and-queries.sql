-- Set up stats extentions
create extension pg_stat_statements;
select * from pg_available_extensions where name = 'pg_stat_statements' and installed_version is not null;

-- Most CPU intensive queries
select query,
       round(total_time::numeric, 2) as total_time,
       calls,
       rows,
       round(total_time::numeric / calls, 2) as avg_time,
       round((100 * total_time / sum(total_time::numeric) over ())::numeric, 2) as percentage_cpu
from pg_stat_statements
order by total_time desc
limit 20;

-- Most time consuming queries
select query,
       round(total_time::numeric, 2) as total_time,
       calls,
       rows,
       round(total_time::numeric / calls, 2) as avg_time,
       round((100 * total_time / sum(total_time::numeric) over ())::numeric, 2) as percentage_cpu
from pg_stat_statements
order by avg_time desc
limit 20;

-- Show running queries
select pid, age(query_start, clock_timestamp()), usename, query
from pg_stat_activity
where query != '<IDLE>'
  and query not ilike '%pg_stat_activity%'
order by query_start desc;
