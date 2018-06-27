class RegisterSerial < ApplicationRecord
  belongs_to :property

  validates :meter_number, :presence => true
  validates :register_number, :presence => true
  validates :register_decimals, :presence => true

  def display
    "#{meter_number}:#{register_number}[#{register_decimals}]"
  end
end
