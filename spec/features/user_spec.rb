require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'valid redirect' do
    visit root_path
    click_on 'login'
    expect(page).to have_content('LOGIN')
  end
end
