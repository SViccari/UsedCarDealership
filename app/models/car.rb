class Car < ActiveRecord::Base
  belongs_to :manufacturer,
    inverse_of: :cars
    
  validates_presence_of :color
  validates_presence_of :year
  validates_presence_of :mileage

  validates_inclusion_of :year, :in => 1980..2014

  # def self.manufacturer_name
  #   @cars.manufacturer.map {|name|}
  # end
end
