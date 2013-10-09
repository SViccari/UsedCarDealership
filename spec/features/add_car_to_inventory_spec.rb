require 'spec_helper'

feature 'user adds a car to inventory', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lost
} do 

  # ACCEPTANCE CRITERIA
  # * I must specify the color, year, mileage of the car.
  # * Only years from 1980 and above can be specified.
  # * I can optionally specify a description of the car.
  # * If I enter all of the required information in the 
  #   required format, the car is recorded.
  # * If I do not specify all of the required information 
  #   in the required formats, the car is not recorded and I am presented with errors.
  # * Upon successfully creating a car, I am redirected 
  #   so that I can create another car.

  scenario 'user successfully adds a car' do 
    prev_count = Car.count

    visit root_path
    click_link 'Add a New Car'
    fill_in 'Color', with: 'Red'
    fill_in 'Year', with: 2000
    fill_in 'Mileage', with: 10000
    fill_in 'Description', with: 'Great condition!'

    click_button 'Save'
    
    expect(page).to have_content("Car successfully saved!")
    expect(Car.count).to eql(prev_count + 1)
  end
end
