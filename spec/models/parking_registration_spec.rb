require 'spec_helper'

describe ParkingRegistration do
  it { should have_valid(:email).when("user@example.com","alex@phin.com") }
  it {should_not have_valid(:email).when(nil, " ", "foo") }

  it {should have_valid(:first_name).when("Alex","phin")}
  it {should_not have_valid(:first_name).when(nil," ") }

  it {should have_valid(:email).when("Alex@phin.com", "user@example.com")}
  it {should_not have_valid(:email).when(nil," ", "c.com")}

  it {should have_valid(:spot_number).when(3, 20, 55)}
  it {should_not have_valid(:spot_number).when(-2, 61, 5200)}

  it {should have_valid(:parked_on).when(Date.today)}
  it {should_not have_valid(:parked_on).when(nil," ")}


end
