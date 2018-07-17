module PropertyService
  class << self
    def create_default_meter(property)
      meter = Meter.create(:property_id => property.id, :reading => 0, :decimal_position => 4)
    end

    def get_properties_by_ownership_status(status)
      Property.joins(:ownerships).where(:ownerships => { :status => status })
    end
  end
end