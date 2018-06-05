class User < ApplicationRecord
  has_one :customer_profile
  
  enum status: [ :inactive, :active ]
  enum role: [ :user, :admin]
end