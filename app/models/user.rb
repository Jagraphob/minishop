class User < ApplicationRecord
  belongs_to :customer

  enum role: [ :user, :admin]
  enum status: [ :inactive, :active ]

  validates :email, :presence => true, :uniqueness => true
  validates :role, :presence => true
  validates :status, :presence => true
end
