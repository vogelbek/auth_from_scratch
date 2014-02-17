require "test_helper"

class SignInTest < Capybara::Rails::TestCase
  test 'log in' do
    visit new_sessions_path

    fill_in 'Username', with: 'testuser'
    fill_in 'Password', with: 'TestUserPassword'

    click_on 'Sign In'

    page.must_have_element '#flash_notice', 'Logged in!'
  end
end
