require "test_helper"

class SignUpTest < Capybara::Rails::TestCase
  test 'sign up' do
    visit new_users_path

    fill_in 'Username', with: 'testuser'
    fill_in 'Password', with: 'TestUserPassword'

    click_on 'Sign Up'

    page.must_have_selector '#flash_notice', text: 'Signed Up!'
  end
end
