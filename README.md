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

hostname -I
https://hub.docker.com/r/apache/kafka-native
https://github.com/confluentinc/cp-docker-images/blob/5.3.3-post/examples/kafka-cluster/docker-compose.yml
