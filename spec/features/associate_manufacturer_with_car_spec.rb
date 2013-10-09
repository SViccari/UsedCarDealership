require 'spec_helper'

feature 'user selects a manufacturer to associate with a car', %Q{
  As a car salesman
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do 

  # ACCEPTANCE CRITERIA
  # * When recording a car listing, I want to optionally associate 
  #   it with its manufacturer.
  # * If I delete a manufacturer, the manufacturer and its primary 
  #   key should no longer be associated with any car listings.

let!(:manufacturer) {FactoryGirl.create(:manufacturer)}

  scenario 'user selects a manufacturer while adding a new car' do 
    car = FactoryGirl.create(:car)
    visit root_path
    click_link 'Add a New Car'
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    select('Toyota', :from => 'manufacturer_manufacturer_id')
    click_button 'Save'

    expect(page).to have_content('Car successfully saved!')
  end
end
