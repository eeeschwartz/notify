require 'spec_helper'

describe 'admin visits new notification page' do
  it 'sends message to selected user' do
    number = '7735551234'
    FactoryGirl.create(:phone, user: FactoryGirl.create(:user), number: number)

    visit new_notifications_path
    check(number)
    fill_in 'Message', with: 'Hello from test env!'
    click_button 'Submit'
    expect(page).to have_content('sent to')
  end
end