class RegisterSerial < ApplicationRecord
  belongs_to :property

  validates :meter_number, :presence => true, :length => { is: 3}, :numericality => { :greater_than_or_equal_to => 0}
  validates :register_number, :presence => true, :length => { is: 2}, :numericality => { :greater_than_or_equal_to => 0}
  validates :register_decimals, :presence => true, :length => { is: 1}, :numericality => { :greater_than_or_equal_to => 0}, :uniqueness => { :scope => [:meter_number, :register_number]}

  def display
    "#{meter_number}:#{register_number}[#{register_decimals}]"
  end
end
