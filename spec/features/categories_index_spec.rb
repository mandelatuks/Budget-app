require 'rails_helper'

RSpec.feature 'Groups', type: :feature do # rubocop:disable Metrics/BlockLength
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email',	with: 'john123@gmail.com'
    fill_in 'Password',	with: 'password'
    fill_in 'Password confirmation',	with: 'password'
    click_button 'Sign up'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'show empty category alert message' do
    expect(page).to have_content('There is no category added yet!')
  end

  scenario 'add new category' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'Test'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    expect(page).to have_content('Test')
    expect(page).to have_button('Logout')
  end

  scenario 'go to created category' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'Test'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    click_link 'Test'
    expect(page).to have_content('$')
    expect(page).to have_content('Delete')
  end

  scenario 'add new category transaction' do
    click_link 'Add a new category'
    fill_in 'Category Name', with: 'Test'
    attach_file('Image or Icon', 'app/assets/images/mugandbean.jpg')
    find('input[name="commit"]').click
    click_link 'Test'
    click_link 'Add Transaction'
    fill_in 'transaction[name]', with: 'Test'
    fill_in 'Amount', with: '50'
    select 'Test'
    find('input[name="commit"]').click
    expect(page).to have_content('Transaction was successfully created')
  end
end
