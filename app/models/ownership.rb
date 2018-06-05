class Ownership < ApplicationRecord
  belongs_to :customer_profile
  belongs_to :property

  enum status: [:pending, :active, :archived]

  validates :status, :presence => true
end