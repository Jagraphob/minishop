class Meter < ApplicationRecord
  belongs_to :property
  has_many :meter_readings, :dependent => :destroy

  validate :reading_stay_or_increase_only

  validates :reading, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :decimal_position, :presence => true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 4, :only_integer => true }

  private

  def reading_stay_or_increase_only
    if reading && reading_was
      errors.add(:reading, 'value cannot be decreased') if reading < reading_was
    end
  end
end