require "spec_helper"
require 'capybara/rspec'

feature "Books" do

  scenario "show books page" do
  	visit '/books'
    expect(page).to have_content 'Listing books'
  end

  scenario "create new book" do
  	visit '/books'
    click_link 'New Book'
    expect(page).to have_content 'New book'
    within("#new_book") do
      fill_in 'book_title', :with => 'H Potter'
      fill_in 'book_author', :with => 'JK Rolling'
    end
    click_button 'Create Book'
    expect(page).to have_content 'Book was successfully created.'

    click_link 'Back'
    expect(page).to have_content 'Listing books'

    within("#books_list") do
      expect(page).to have_content 'H Potter'
      expect(page).to have_content 'JK Rolling'
    end

  end

end