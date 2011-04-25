class StoreFront
  include Mongoid::Document

  field :name
  field :domain
  field :address
  field :location, type => Array
  
  index [[ :location, Mongo::GEO2D ]]

  before_save :set_location

  def set_location
    self.location = Geocoder.search(self.address).first.try(:coordinates)
  end
end
