module Bank
  class BusinessCategory
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    field :name,   type: String
    field :number, type: String

    validates :name, presence: true, uniqueness: true

    default_scope ->{order(:id.asc)}
  end
end
