require "spec_helper"
require 'capybara/rspec'

feature "Books" do

  scenario "should show books page" do
  	visit '/books'
    expect(page).to have_content 'Listing books'
    print page.body
  end

end