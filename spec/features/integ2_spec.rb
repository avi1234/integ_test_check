require "spec_helper"
require 'capybara/rspec'

feature "Books" do

  scenario "show books page" do
  	visit '/books'
    expect(page).to have_content 'Listing books'
    print page.body
  end

  scenario "create new book" do
  	visit '/books/new'
    expect(page).to have_content 'New book'
    within("#new_book") do
      fill_in 'book_title', :with => 'H Potter'
      fill_in 'book_author', :with => 'JK Rolling'
    end
    click_button 'Create Book'
    print page.body
    expect(page).to have_content 'Book was successfully created.'
  end

end