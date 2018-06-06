class RegisterSerial < ApplicationRecord
  belongs_to :property

  validates :meter_number, :presence => true
  validates :register_number, :presence => true
  validates :register_decimals, :presence => true
end
