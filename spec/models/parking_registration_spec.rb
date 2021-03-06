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



describe 'parking' do
  it 'parks the car for today' do
    registration = FactoryGirl.build(:parking_registration, parked_on: nil)
      expect(registration.park).to eql(true)
      expect(registration.parked_on).to eql(Date.today)
         end
        it "only allows one registration per day" do
          prev_registraion = FactoryGirl.create(:parking_registration)
          registration = FactoryGirl.build(:parking_registration,
            spot_number:prev_registraion.spot_number,
            parked_on: prev_registraion.parked_on)
          expect(registration.park).to be_false
          expect(registration).to_not be_valid
          expect(registration.errors[:spot_number]).to_not be_blank
        end
  end
end