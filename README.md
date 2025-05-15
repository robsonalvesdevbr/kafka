## Cluster Kafka e Redpanda Console

[Imagem do kafka-native][1]

[Imagem do Redpanda Console][2]

```bash
# Para executar o cluster do kafka com SASL, execute o seguinte comando:
# Definição do SASL no arquivo docker-compose.override.yml
docker-compose up -d

# Para executar o cluster do kafka sem SASL, execute o seguinte comando:
docker-compose -f docker-compose.yml up -d

docker exec -it kafka-cluster_kafka-1_1 bash
kafka-topics --create --bootstrap-server localhost:29092 --replication-factor 3 --partitions 3 --topic meutopico
kafka-topics --list --bootstrap-server localhost:29092

kafka-console-producer --broker-list localhost:29092 --topic meutopico
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico --from-beginning
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico --from-beginning --group meugrupoa

kafka-topics --describe --bootstrap-server localhost:29092 --topic meutopico

kafka-consumer-groups --describe --group meugrupoa --bootstrapserver localhost:29092 --topic meutopico

docker exec -it ksqldb-cli ksql http://ksqldb-server:8088
ksql> show streams;
ksql> show tables;
ksql> show topics;
ksql> create stream client_created_stream (id int, name string) with (kafka_topic='postgres-connect-client', value_format='json');
ksql> create stream client_created_stream (id int, name string) with (kafka_topic='postgres-connect-client', value_format='json_sr');
ksql> create stream client_created_stream (id int, name string) with (kafka_topic='postgres-connect-client', key_format='json_sr', value_format='json_sr');
ksql> select * from client_created_stream;
ksql> select * from client_created_stream emit changes;
ksql> create table last_client_created_table as select id, name from client_created_stream group by id, name emit changes;
ksql> create table last_client_created_table as select id, LATEST_BY_OFFSET(name) AS name from client_created_stream group by id emit changes;
ksql> create table last_client_created_table as select LATEST_BY_OFFSET(id) as last_id, name, count(*) as quantity  from client_created_stream group by name emit changes;
ksql> SET 'auto.offset.reset' = 'earliest';
```

```bash
hostname -I
```

[1]: https://hub.docker.com/r/apache/kafka-native "Imagem docker para p kafka-native"
[2]: https://hub.docker.com/r/redpandadata/console "Imagem docker para Redpanda Console"
[3]: https://github.com/confluentinc/cp-docker-images/blob/5.3.3-post/examples/kafka-cluster/docker-compose.yml "Exemplos de cluster da confluent kafka"
[4]: https://docs.confluent.io/platform/7.0/connect/confluent-hub/component-archive.html "Confluent Hub"
[5]: https://docs.confluent.io/platform/current/connect/references/restapi.html "Confluent Rest API"
[6]: https://docs.confluent.io/platform/current/connect/index.html "Confluent Connect"
[7]: https://docs.confluent.io/platform/current/schema-registry/fundamentals/schema-evolution.html "Confluent Schema Registry"
[8]: https://docs.confluent.io/platform/current/installation/docker/config-reference.html "Confluent Docker Config Reference"
[9]: https://github.com/confluentinc/kafka-rest "Confluent Kafka Rest"
[10]: https://developer.confluent.io/courses/schema-registry/schema-compatibility/ "Confluent Schema Registry"
[11]: https://docs.confluent.io/platform/current/ksqldb/quickstart.html#ksqldb-quick-start-create-docker-compose-file "Confluent ksqlDB"