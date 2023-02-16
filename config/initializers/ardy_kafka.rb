ArdyKafka.configure do |c|
  c.brokers = ENV['ARDY_KAFKA_HOST_URI']
end