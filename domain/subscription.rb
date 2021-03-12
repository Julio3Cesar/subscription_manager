class Subscription < ::Entity
  attr_accessor :id, :periodicity, :customer_id, :created_at, :updated_at
  attr_accessor :plan

  def initialize(id: nil, periodicity:, customer_id:, plan: nil)
    super(id: id)
    @periodicity = periodicity
    @customer_id = customer_id
    @plan = plan
  end
end
