require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'login successfully' do
    visit root_path
    click_on 'login'
    expect(page).to have_content('login')
  end
end
