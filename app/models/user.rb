class User < ApplicationRecord
  belongs_to :customer, :optional => true

  enum role: [ :user, :admin]
  enum status: [ :inactive, :active ]

  validates :email,
    :presence => true,
    :uniqueness => true,
    :format => { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
    
  validates :role, :presence => true, :numericality => true
  validates :status, :presence => true, :numericality => true
end
