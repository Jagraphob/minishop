class Property < ApplicationRecord
  has_many :register_serials, dependent: :destroy

  has_many :ownerships
  has_many :customer_profiles, through: :ownerships

  validates :number, presence: true
  validates :street_name, presence: true
  validates :suburb, presence: true
  validates :city, presence: true
  validates :region, presence: true
  
end