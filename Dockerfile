FROM ruby:3.1.3
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp

COPY ardy_kafka-0.1.0.gem /myapp/
RUN mkdir -p /local_gems/
RUN gem install -i /local_gems /myapp/ardy_kafka-0.1.0.gem

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.3.26
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]