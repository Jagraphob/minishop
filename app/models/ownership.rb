class Ownership < ApplicationRecord
  belongs_to :customer
  belongs_to :property

  enum status: [:pending, :active, :archived]

  validates :status, :presence => true
  validates :customer_id, :uniqueness => {:scope => :property_id}
end
