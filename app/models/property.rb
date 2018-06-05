class Property < ApplicationRecord
  has_many :register_serials, dependent: :destroy
  has_many :ownerships
  has_many :customer_profiles, through: :ownerships
end