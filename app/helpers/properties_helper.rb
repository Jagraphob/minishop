module PropertiesHelper
  def full_address(property)
    "#{property.number} #{property.street_name}, #{property.suburb}, #{property.city}, #{property.postcode}"
  end

  def filter_by_ownership_status(properties, status)
    properties.joins(:ownerships).where(:ownerships => { :status => status })
  end
end