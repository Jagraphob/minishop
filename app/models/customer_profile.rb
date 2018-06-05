class CustomerProfile < ApplicationRecord
  has_many :ownerships
  has_many :properties, through: :ownerships
end