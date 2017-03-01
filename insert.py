#!/usr/bin/python

from cassandra.cluster import Cluster
cluster=Cluster()
keyspace='rapcas'
connection=cluster.connect(keyspace)
rows=connection.execute("insert into users(id, email, name, password) values('user1', 'user1@example.com', 'foo', 'super secret'); ")
rows=connection.execute("insert into users(id, email, name, password) values('user2', 'user2@example.com', 'foo', 'super secret'); ")
rows=connection.execute("insert into users(id, email, name, password) values('user3', 'user3@example.com', 'foo', 'super secret'); ")



############################################################
# n.b: 'rapcas' keyspace is already 
#  created
#
#////////////////////////////////////////
#  Output:
#  
#cqlsh:rapcas> select * from rapcas.users;
#
# id    | email             | name | password
#-------+-------------------+------+--------------
#user2 | user2@example.com |  foo | super secret
# user1 | user1@example.com |  foo | super secret
#user3 | user3@example.com |  foo | super secret
###########################################################
