## Cluster Kafka e Redpanda Console

[Imagem do kafka-native][1]

[Imagem do Redpanda Console][2]

```bash
docker-compose up -d
Docker exec -it kafka-cluster_kafka-1_1 bash
kafka-topics --create --bootstrap-server localhost:29092 --replication-factor 3 --partitions 3 --topic meutopico
kafka-topics --list --bootstrap-server localhost:29092

kafka-console-producer --broker-list localhost:29092 --topic meutopico
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico --from-beginning
kafka-console-consumer --bootstrap-server localhost:29092 --topic meutopico --from-beginning --group meugrupoa

kafka-topics --describe --bootstrap-server localhost:29092 --topic meutopico

kafka-consumer-groups --describe --group meugrupoa --bootstrapserver localhost:29092 --topic meutopico
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
