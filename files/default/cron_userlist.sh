
# this file was placed by chef, manual changes will be overwritten

tmpfile=$(mktemp) 
psql -h localhost      -p 5432 -U postgres       -qAtX -c 'SELECT $$"$$ || replace( usename, $$"$$, $$""$$) || $$" "$$ || replace( passwd, $$"$$, $$""$$ ) || $$"$$ from pg_shadow where passwd is not null and (usename like '"'"'%_ro'"'"' or  usename = '"'"'postgres'"'"' or usename like '"'"'%_ds'"'"') order by 1' > $tmpfile 2> /dev/null
psql -h localhost      -p 5432 -U postgres       -qAtX -c 'SELECT $$"$$ || replace( usename, $$"$$, $$""$$) || $$" "$$ || replace( passwd, $$"$$, $$""$$ ) || $$"$$ from pg_shadow where passwd is not null and (usename = '"'"'counprof_ro'"'"') order by 1' >> $tmpfile 2> /dev/null

tmp_sum=$(md5sum $tmpfile | awk '{print $1}')
cur_sum=$(md5sum /etc/pgbouncer/userlist.txt | awk '{print $1}')
if [  "$tmp_sum" != "$cur_sum" ] ; then
  cat $tmpfile > /etc/pgbouncer/userlist.txt
fi

rm -f $tmpfile
  
