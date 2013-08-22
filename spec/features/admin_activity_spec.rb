require 'spec_helper'

feature "Signing in as an Admin" do
  background do
    AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  end
  scenario "with correct admin details" do
    visit new_admin_user_session_url
    fill_in 'Email', :with => 'admin@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    expect(page).to have_content 'Activities'
  end
end

feature "Admin user managing Activities" do
  background do
    AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")
    @activity = Activity.create(name: "TestActivity")
    visit new_admin_user_session_url
    fill_in 'Email', :with => 'admin@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
  end
  scenario "viewing activities" do
    click_on 'Activities'
    expect(page).to have_content "TestActivity"
  end
  scenario "creating an activity" do
    click_on 'Activities'
    click_on 'New Activity'
    fill_in 'Name', with: 'newActivity'
    click_on 'Create'
    expect(page).to have_content 'newActivity'
  end
  scenario "editing an activity" do
    click_on 'Activities'
    expect(page).to have_content 'TestActivity'
    # within("#index_table_activities tr:nth-child(1)") do
    click_on 'Edit'
    # end
    fill_in 'Name', with: 'TestActivity1'
    click_on 'Update Activity'
    expect(page).to have_content "Successfully updated!"
    expect(page).to have_content 'TestActivity1'
  end
  scenario 'add tags to an activity' do
    t = Tag.create(name: 'TestTag')
    click_on 'Activities'
    click_on 'Edit'
    check 'TestTag'
    click_on 'Update Activity'
    @activity.tags.count.should be > 0
  end
end
