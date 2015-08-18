require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new animal', {:type => :feature}) do
  it('allows a user to add an animal to the database') do
    visit('/')
    click_link('Shelter Employees')
    expect(page).to have_content('Shelter Employee Page')
    fill_in('name', :with => 'Mika')
    fill_in('gender', :with => 'female')
    fill_in('type', :with => 'cat')
    fill_in('breed', :with => 'Turkish Angora')
    fill_in('admit_date', :with => '2015-08-01')
    fill_in('adopter_id', :with => 1)
    click_button('Add Animal')
    expect(page).to have_content('Success!')
  end
end
