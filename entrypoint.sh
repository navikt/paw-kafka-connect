#!/usr/bin/env bash

export CONNECT_BOOTSTRAP_SERVERS=$KAFKA_BROKERS

# Avro specific config
export CONNECT_KEY_CONVERTER=org.apache.kafka.connect.storage.StringConverter
export CONNECT_VALUE_CONVERTER=io.confluent.connect.avro.AvroConverter

# SSL/Security config for Kafka
export CONNECT_SECURITY_PROTOCOL=SSL
export CONNECT_SSL_KEYSTORE_TYPE_CONFIG=pkcs12
export CONNECT_SSL_TRUSTSTORE_LOCATION=$KAFKA_TRUSTSTORE_PATH
export CONNECT_SSL_TRUSTSTORE_PASSWORD=$KAFKA_CREDSTORE_PASSWORD
export CONNECT_SSL_KEYSTORE_LOCATION=$KAFKA_KEYSTORE_PATH
export CONNECT_SSL_KEYSTORE_PASSWORD=$KAFKA_CREDSTORE_PASSWORD

export CONNECT_CONSUMER_SECURITY_PROTOCOL=SSL
export CONNECT_CONSUMER_SSL_KEYSTORE_TYPE_CONFIG=pkcs12
export CONNECT_CONSUMER_SSL_TRUSTSTORE_LOCATION=$KAFKA_TRUSTSTORE_PATH
export CONNECT_CONSUMER_SSL_TRUSTSTORE_PASSWORD=$KAFKA_CREDSTORE_PASSWORD
export CONNECT_CONSUMER_SSL_KEYSTORE_LOCATION=$KAFKA_KEYSTORE_PATH
export CONNECT_CONSUMER_SSL_KEYSTORE_PASSWORD=$KAFKA_CREDSTORE_PASSWORD

 # Schema registry config
export SCHEMA_REGISTRY=$KAFKA_SCHEMA_REGISTRY
export CONNECT_KEY_CONVERTER_SCHEMA_REGISTRY_URL=$SCHEMA_REGISTRY
export CONNECT_KEY_CONVERTER_BASIC_AUTH_CREDENTIALS_SOURCE=USER_INFO
export CONNECT_KEY_CONVERTER_BASIC_AUTH_USER_INFO=$KAFKA_SCHEMA_REGISTRY_USER:$KAFKA_SCHEMA_REGISTRY_PASSWORD
export CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL=$SCHEMA_REGISTRY
export CONNECT_VALUE_CONVERTER_BASIC_AUTH_CREDENTIALS_SOURCE=USER_INFO
export CONNECT_VALUE_CONVERTER_BASIC_AUTH_USER_INFO=$KAFKA_SCHEMA_REGISTRY_USER:$KAFKA_SCHEMA_REGISTRY_PASSWORD

# Internal config
export CONNECT_CONFIG_STORAGE_TOPIC=${KAFKA_TOPIC_PREFIX}-configs
export CONNECT_OFFSET_STORAGE_TOPIC=${KAFKA_TOPIC_PREFIX}-offsets
export CONNECT_STATUS_STORAGE_TOPIC=${KAFKA_TOPIC_PREFIX}-status

export CONNECT_INTERNAL_KEY_CONVERTER=org.apache.kafka.connect.json.JsonConverter
export CONNECT_INTERNAL_KEY_CONVERTER_SCHEMAS_ENABLE=false
export CONNECT_INTERNAL_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter
export CONNECT_INTERNAL_VALUE_CONVERTER_SCHEMAS_ENABLE=false
export CONNECT_ALLOW_AUTO_CREATE_TOPICS=false

export CONNECT_CONNECTOR_CLIENT_CONFIG_OVERRIDE_POLICY=Principal

exec bash -c /etc/confluent/docker/run