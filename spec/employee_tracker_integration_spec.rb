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

describe('the path to update a division', {:type => :feature}) do
  it('will show a form to update a new division') do
    division = Division.create({:name => 'Sales'})
    visit('/')
    click_on('See divisions')
    click_on('Update this division')
    fill_in('name', :with => 'IT')
    click_button('Rename')
    expect(page).to have_content('IT')
  end
end

describe('the path to delete a division', {:type => :feature}) do
  it('will show a form to delete a division') do
    division = Division.create({:name => 'Sales'})
    visit('/')
    click_on('See divisions')
    click_on('Update this division')
    click_button('Delete')
    expect(page).to have_no_content('Sales')
  end
end
