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

  scenario "With Valid Attributes User find a spot" do
    prev_count = ParkingRegistration.count
    visit '/'
    fill_in "First Name", with: "Alex"
    fill_in "Last Name", with: "Phin"
    fill_in "Email", with: "Alex@phin.com"
    fill_in "Spot number", with: 5
    click_button "Register"
    expect(page).to have_content("You Registed Successully")
    expect(ParkingRegistration.count).to eql(prev_count +1 )

  end
end
