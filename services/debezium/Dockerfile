FROM debezium/connect:2.5

# ─── Install Confluent S3 Sink Connector plugin ───
# Download and extract into the Kafka Connect plugin path
USER root

ENV CONFLUENT_S3_VERSION=10.5.7

RUN mkdir -p /kafka/connect/confluent-s3-sink && \
    cd /tmp && \
    curl -fSL "https://d2p6pa21dvn84.cloudfront.net/api/plugins/confluentinc/kafka-connect-s3/versions/${CONFLUENT_S3_VERSION}/confluentinc-kafka-connect-s3-${CONFLUENT_S3_VERSION}.zip" \
         -o s3-sink.zip && \
    unzip -q s3-sink.zip -d /tmp/s3-sink && \
    cp /tmp/s3-sink/confluentinc-kafka-connect-s3-${CONFLUENT_S3_VERSION}/lib/*.jar /kafka/connect/confluent-s3-sink/ && \
    rm -rf /tmp/s3-sink /tmp/s3-sink.zip

USER kafka
