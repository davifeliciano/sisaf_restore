echo "pg_restore: Restoring database from sisaf.dump"
pg_restore --username postgres --role postgres --dbname sisaf /sisaf.dump
echo "pg_restore: Done!"