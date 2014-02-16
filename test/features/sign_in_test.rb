require "test_helper"

class SignInTest < Capybara::Rails::TestCase
  test 'log in' do
    visit root_path
    fill_in 'User Name', 'testuser'
    fill_in 'Password','TestUserPassword'

    click 'Sign In'

    page.must_have_element '#flash_notice', 'Logged in!'
  end
end
