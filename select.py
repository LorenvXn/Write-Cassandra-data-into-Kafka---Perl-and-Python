#!/usr/bin/python

from cassandra.cluster import Cluster
cluster=Cluster()
keyspace='rapcas'
connection=cluster.connect(keyspace)
rows=connection.execute('select * from rapcas.users')
for user_rows in rows:
	print user_rows.email
