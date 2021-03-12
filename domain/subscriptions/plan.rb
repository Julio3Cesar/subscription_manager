module Subscriptions
  class Plan < ::Entity
    attr_accessor :id, :name, :external_id, :created_at, :updated_at
    attr_accessor :subscription

    def initialize(id: nil, name:, external_id:, subscription:)
      super(id: id)
      @name = name
      @external_id = external_id
      @subscription = subscription
    end
  end
end
