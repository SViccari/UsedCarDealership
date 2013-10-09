require 'spec_helper'

feature 'add a manufacturer to a create a list of manufacturers',%Q{
  As a car salesperson
  I want to record a car manufactuer
  So that I can keep track of the types of cars found in the lot
} do

  # ACCEPTANCE CRITERIA
  # * I must specify a manufacturer name, and country.
  # * If I do not specify the required information, I am presented with errors.
  # * If I specify the required information, the manufacturer is recorded and 
  #   I am redirected to enter another new manufacturer. 

  scenario 'user adds a manufacturer' do
  prev_count = Manufacturer.count

  visit root_path
  click_link "Add Manufacturer"
  fill_in "Name", with: 'Toyota' 
  fill_in "Country", with: 'Japan'
  click_button 'Save'

  expect(page).to have_content("Manufacturer successfully saved!")
  expect(Manufacturer.count).to eql(prev_count + 1)
  end

  scenario 'user fails to provide valid manufacturer information' do
  prev_count = Manufacturer.count

  visit root_path
  click_link "Add Manufacturer"
  click_button 'Save'

  expect(page).to_not have_content("Manufacturer successfully saved!")
  expect(Manufacturer.count).to eql(prev_count)
  end
end
