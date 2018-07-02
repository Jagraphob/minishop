class Customer < ApplicationRecord
  has_one :user

  has_many :ownerships
  has_many :properties, :through => :ownerships

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone_number, :presence => true, :length => { in: 8..10 }, :format => { :with => /\A[+-]?\d+\z/, :message => "must be numeric" }
  validates :card_number, :presence => true, :length => { :is => 16 }, :format => { :with => /\A[+-]?\d+\z/, :message => "must be numeric" }
end