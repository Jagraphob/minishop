class CustomerProfile < ApplicationRecord
  belongs_to :user

  has_many :ownerships
  has_many :properties, :through => :ownerships

  validates :phone_number, :presence => true
  validates :card_number, :presence => true
end