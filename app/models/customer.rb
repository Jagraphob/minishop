class Customer < ApplicationRecord
  has_many :ownerships
  has_many :properties, :through => :ownerships

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone_number, :presence => true
  validates :card_number, :presence => true
end