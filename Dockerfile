FROM confluentinc/cp-kafka-connect:7.4.1
RUN confluent-hub install --no-prompt wepay/kafka-connect-bigquery:2.3.5

# Setup JMX exporter
ADD --chown=appuser:appuser \
    https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar \
    jmx-kafka-connect-prometheus.yaml \
    /usr/local/jmx_prometheus/
ENV EXTRA_ARGS="-javaagent:/usr/local/jmx_prometheus/jmx_prometheus_javaagent-0.16.1.jar=5556:/usr/local/jmx_prometheus/jmx-kafka-connect-prometheus.yaml" \
    KAFKA_JMX_PORT=5555 \
    KAFKA_JMX_HOSTNAME=localhost

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
