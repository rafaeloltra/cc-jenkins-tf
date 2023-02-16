CREATE STREAM users_stream (id INTEGER KEY, gender STRING, name STRING, age INTEGER) WITH (kafka_topic='users', partitions=6, value_format='JSON');
