class UserEventProducer
  def send_user_created(user)
    produce(user, 'user_created')
  end

  def user_updated(user)
    produce(user, 'user_updated')
  end

  def user_deleted(user)
    produce(user, 'user_deleted')
  end

  private

  def produce(user, type)
    producer.produce(topic: 'users', payload: payload(user, type))
  end

  def payload(user, type)
    {
      type: type,
      data: {
        id: user.id,
        first_name: user.first_name,
        last_name:
      }
    }
  end

  def producer
    ArdyKafka::Producer.new
  end
end