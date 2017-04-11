require 'rails_helper'

RSpec.feature "Logins", type: :feature do

  scenario 'User wants to register' do

    visit '/'

    click_link 'Register'

    within('#new_user') do
      fill_in 'Name', with: Faker::Name.name

      fill_in 'Email', with: Faker::Internet.email

      fill_in 'Password', with: 'Secure@password1'
      fill_in 'Password Confirmation', with: 'Secure@password1'

      fill_in 'Birthdate', with: '23/11/1985'
    end

    click_button 'Sign up'

    expect(page).to have_current_path(root_path)
  end

  scenario 'User wants to login and logout' do

    password = 'secure@password'
    user = create(:user, password: password, password_confirmation: password)

    visit '/'

    click_link 'Login'

    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
    end

    click_button 'Sign in'

    expect(page).to have_current_path(root_path)

    first(:link, 'Logout').click

    expect(page).to have_current_path(root_path)
  end

end
