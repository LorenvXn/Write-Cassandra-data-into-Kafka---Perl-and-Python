# Write-Cassandra-data-into-Kafka---Perl-and-Python


Short example:

1) Create 'rapcas' keyspace and users (see insert.py script) </br>
2) Make sure Zookeeper is running </br>
3) Start broker:
```
 sudo bin/kafka-server-start.sh config/server.properties

```

4) Start consumer, with "mumu" topic: 

```
bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic mumu

```

5) Run perl script producer.pl for collecting data from Cassandra and writing into consumer.

The output in consumer will be:

```

bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic mumu

first message! Yey!
15:20

another message
user2@example.com
user1@example.com
user3@example.com

Zah End!
```
