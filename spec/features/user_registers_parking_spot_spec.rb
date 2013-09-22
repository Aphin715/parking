require 'spec_helper'

feature "user registers a parking spot", %Q{
  As a parker
  I want to register my spot with my name
  So that the parking company can identify my car
} do
    # Acceptance Criteria:

    # I must specify a first name, last name, email, and parking spot number
    # I must enter a valid parking spot number
    # (the lot has spots identified as numbers 1-60)
    # I must enter a valid email
    #If I specify a parking spot that has already been checked in for the day, I am told I can't check in there.
    #If I specify a spot that hasn't yet been parked in today, I am able to check in.


    #Also Covers
    #As a parker
    #I cannot check in to a spot that has already been checked in
    #So that two cars are not parked in the same spot



  scenario "Attempts to register spot that is taken" do
    FactoryGirl.create(:parking_registration,
     spot_number: 25, parked_on: Date.today)

    prev_count = ParkingRegistration.count
    visit "/"
    fill_in 'First name', with: "Alex"
    fill_in "Last name", with: "Phin"
    fill_in "Email", with: "Alex@phin.com"
    fill_in "Spot number", with: 25
    click_button "Register"

    expect(page).to_not have_content("You registered successfully")
    expect(page).to have_content("Spot number has already been taken")
    expect(ParkingRegistration.count).to eql(prev_count)
  end
 end
