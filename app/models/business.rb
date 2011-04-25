class Business
  include Mongoid::Document

  field :name
  has_many :locations
end
