class RegisterSerial < ApplicationRecord
  belongs_to :property

  validates :meter_number, :presence => true, :length => { is: 3}, :format => { with: /\A[+-]?\d+\z/, :message => "must be numeric" }
  validates :register_number, :presence => true, :length => { is: 2}, :format => { with: /\A[+-]?\d+\z/, :message => "must be numeric" }
  validates :register_decimals, :presence => true, :length => { is: 1}, :format => { with: /\A[+-]?\d+\z/, :message => "must be numeric" }

  def display
    "#{meter_number}:#{register_number}[#{register_decimals}]"
  end
end
