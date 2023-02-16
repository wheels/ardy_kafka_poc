class UserConsumer < ArdyKafka::Consumer
  consumer_config topics: 'users', group_id: 'users consumer', errors_topic: 'users_errors'

  def process(message)
    case message['type']
    when 'user_created', 'user_updated'
      # upsert
    when 'user_deleted'
      # delete
    end
  end
end