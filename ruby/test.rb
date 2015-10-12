#! /usr/bin/ruby -w
env = "haha"
db_conn = if env == :stg
    "-h10.16.4.219 -uroot -pmojiti sapi"
  else
    '-hels.hamysql.prod.hulu.com -uhasql-sapi -psapi sapi'
  end

# IMPORTANT!!
# if you change this table schema, remember also need to change update_autocomp_score.py FIELDS
cmd = %q/echo 'ls'/
puts `#{cmd}`

