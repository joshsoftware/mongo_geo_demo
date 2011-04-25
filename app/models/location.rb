class Location
  include Mongoid::Document
  extend Mongoid::Geo::Near

  field :address
  field :coordinates, :type => Array, :geo => true

  geo_index :coordinates

  belongs_to :businesses

  before_save :update_coordinates

  def update_coordinates
    self.coordinates = Geocoder.search(self.address).first.try(:coordinates) if self.coordinates_changed? || self.new_record?
  end
end
