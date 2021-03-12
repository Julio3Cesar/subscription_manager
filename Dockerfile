FROM ruby:2.7.2

WORKDIR /var/www/subscription_manager
COPY . .
RUN bundle install
CMD ["ruby", "initialize.rb"]
