class Property < ApplicationRecord
  has_many :register_serials, :dependent => :destroy

  has_many :ownerships
  has_many :customers, :through => :ownerships

  validates :number, :presence => true
  validates :street_name, :presence => true
  validates :suburb, :presence => true
  validates :city, :presence => true
  validates :region, :presence => true
  #validates :icp_number, :uniqueness => {:message => "Invalid ICP Number, please check your ICP number or call us 0800-NO-PICKUP"}

  accepts_nested_attributes_for :register_serials

  def icp_number=(val)
    write_attribute :icp_number, val.upcase
  end
end