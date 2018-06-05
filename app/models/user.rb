class User < ApplicationRecord
  has_one :customer_profile
  
  enum status: [ :inactive, :active ]
  enum role: [ :user, :admin]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :status, presence: true
end