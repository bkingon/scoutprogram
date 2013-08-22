require 'spec_helper'

feature 'Active admin managing programs' do
  background do
    AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")
    Program.create(name: "TestProgram")
    visit new_admin_user_session_url
    fill_in 'Email', :with => 'admin@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
  end
  scenario 'view list of programs' do
    click_on 'Programs'
    expect(page).to have_content 'TestProgram'
  end
end
