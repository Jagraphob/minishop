class Meter < ApplicationRecord
  belongs_to :property

  validates :reading, :presence => true, :numericality => { true }
  validates :decimal_position, :presence => true, :numericality { :greater_than_or_equal_to =>0, :less_than_or_equal_to => 4, only_integer: true }

  def display
    number_with_precision(reading, :precision => decimal_position)
  end
end