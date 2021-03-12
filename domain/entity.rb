class Entity
  attr_accessor :id

  def initialize(id:)
    @id = id ? id : SecureRandom.uuid
  end
end
