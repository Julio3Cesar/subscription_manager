require 'redis'

module Subscriptions
  module Repositories
    class SubscriptionRepository

      def initialize
        @redis_conn = Redis.new(url: ENV['REDIS_URL'])
      end

      def create(subscription)
        subscription.created_at = Time.now
        subscription.updated_at = Time.now
        redis_conn.set("Subscription:#{subscription.id}", subscription.to_yaml)
      end

      private

      attr_reader :redis_conn
    end
  end
end
