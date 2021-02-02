require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Signing in a new user' do
    visit '/'
    click_button 'login'

    expect(page).to have_text('login')
  end
end
