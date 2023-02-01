# Kafka-Connect

Starter en instans av Kafka-Connect som primært er konfigurert for å bruke Kafka som source og BigQuery som sink.

Kan utvides til å støtte flere type Connectors.

## Konfigurasjon av Connectors

Connectors settes opp som ConfigMap i hver app som ønsker en connector. [paw-kafka-connect-operator](https://github.com/navikt/paw-kafka-connect-operator) sørger for at endringer reflekteres i Kafka-Connect.
