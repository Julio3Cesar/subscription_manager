module Subscriptions
  module Commands
    class InitSubscriptionCommand

      def initialize(order_params)
        @periodicity = order_params[:periodicity]
        @customer_id = order_params[:customer_id]
        @plan_external_id = order_params[:plan_external_id]
        @subscription_repository = Subscriptions::Repositories::SubscriptionRepository.new
      end

      def execute
        response = Net::HTTP.get_response(URI("#{ENV['CATALOG_HOST']}/plans/#{@plan_external_id}"))
        plan_infos = JSON.parse(response.body)

        subscription = Subscription.new(periodicity: periodicity, customer_id: customer_id)
        plan = Plan.new(name: plan_infos['name'], external_id: @plan_external_id, subscription: subscription)
        subscription.plan = plan

        subscription_repository.create(subscription)
      end

      private

      attr_reader :periodicity, :customer_id, :plan_external_id
      attr_reader :subscription_repository
    end
  end
end
