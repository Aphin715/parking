class ParkingRegistration < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_presence_of :parked_on
  validates_numericality_of :spot_number,
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 60

    validates_uniqueness_of :spot_number,
    scope:  :parked_on

    def park
      self.parked_on = Date.today
      save
    end
end
