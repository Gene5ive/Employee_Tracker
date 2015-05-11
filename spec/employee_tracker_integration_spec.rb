require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to see all divisions', {:type => :feature}) do
  it('will show all the divisions') do
    visit('/')
    click_on('See divisions')
    expect(page).to have_content("Here are the divisions:")
  end
end

describe('the path to add a new division', {:type => :feature}) do
  it('will show a form to input a new division') do
    visit('/')
    click_on('See divisions')
    click_on('Add a division')
    fill_in('name', :with => 'IT')
    click_button('Add')
    expect(page).to have_content('IT')
  end
end
