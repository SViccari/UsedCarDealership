class Manufacturer < ActiveRecord::Base
  has_many :cars,
    inverse_of: :manufacturer,
    dependent: :nullify

  validates_presence_of :name
  validates_presence_of :country
end
