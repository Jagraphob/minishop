class MeterReading < ApplicationRecord
  belongs_to :meter

  validates :reading, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
end