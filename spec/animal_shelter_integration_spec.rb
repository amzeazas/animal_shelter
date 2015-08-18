require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new animal', {:type => :feature}) do
  it('allows a user to add an animal to the database') do
    visit('/')
    click_link('Shelter Employees')
    fill_in('name', :with => "Mika"; 'gender', :with => "female"; 'type', :with => "cat"; 'breed', :with => "Turkish Angora"; 'admit_date', :with => '2015-08-01')
    click_button('Add Animal')
    expect(page).to have_content('Success!')
  end
end
