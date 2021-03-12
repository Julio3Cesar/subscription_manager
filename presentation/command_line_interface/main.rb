require 'redis'

module CommandLineInterface
  class Main

    def main
      params = { periodicity: 12, customer_id: 12000435, plan_external_id: 'c55fabc5-963d-4255-a3ac-6106af020f17' }
      command = ::Subscriptions::Commands::InitSubscriptionCommand.new(params)
      command.execute
      Redis.new(url: ENV['REDIS_URL']).keys('Subscription:*').each do |key|
        pp Redis.new(url: ENV['REDIS_URL']).get(key)
      end
    end
  end
end

