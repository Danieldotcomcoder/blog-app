require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
   
  describe 'index page' do
    before :all do
      user1 = User.new(
        Name: 'Danny',
        email: 'dan@hotmail.com',
        password: '123456',
        password_confirmation: '123456',
        role: 'admin'
      )
      user1.skip_confirmation!
      
    end
    it 'shows the right content' do
      visit user_session_path
      click_button 'Log in'
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_selector(:link_or_button, 'Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Test for wrong input' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'dan@hotmail.com'
        fill_in 'Password', with: '123456789'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Test for right input' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'dan@hotmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
   
 end
end