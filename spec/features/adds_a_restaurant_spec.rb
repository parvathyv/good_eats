require 'rails_helper'

feature 'user adds a new restaurant', %Q{
  As a site visitor
  I want to add one of my favorite restaurants
  So that I can encourage others to binge eat there
} do

  # Acceptance Criteria:
  # * I must provide the restaurant's name
  # * I must provide the restaurant's address
  # * I must provide the restaurant's city
  # * I must provide the restaurant's state
  # * I must provide the restaurant's zip
  # * I can optionally provide a description and a category
 

  scenario 'user adds a new restaurant' do
    attrs = {
      name: 'Darbar',
      address: '33, Harrison Ave',
      city: 'Boston',
      state: 'MA',
      zip: '02116'
    }

    restaurant = Restaurant.new(attrs)

    visit '/restaurants/new'
    fill_in 'Name', with: restaurant.name
    fill_in 'Address', with: restaurant.address
    fill_in 'City', with: restaurant.city
    fill_in 'State', with: restaurant.state
    fill_in 'Zip', with: restaurant.zip

    click_on 'Create'

    expect(page).to have_content 'Restaurant was successfully created.'
   
  end

  scenario 'without required attributes' do
    visit '/restaurants/new'
    click_on 'Create'

    expect(page).to_not have_content 'Restaurant was successfully created.'
    expect(page).to have_content "can't be blank"
  end


  scenario 'user cannot add a restaurant that is already in the database' do
    
    attrs = {
      name: 'Darbar',
      address: '33, Harrison Ave',
      city: 'Boston',
      state: 'MA',
      zip: '02116'
    }

    restaurant = Restaurant.create(attrs)

    visit '/restaurants/new'
    fill_in 'Name', with: restaurant.name
    fill_in 'Address', with: restaurant.address
    fill_in 'City', with: restaurant.city
    fill_in 'State', with: restaurant.state
    fill_in 'Zip', with: restaurant.zip
    click_on 'Create'

    expect(page).to_not have_content 'Restaurant was successfully created.'
    expect(page).to have_content "has already been taken"
  end
  
end
