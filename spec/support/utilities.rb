include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    :with=> user.email
  fill_in "Password", :with=> user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end
# heres the implementation custom matcher, allowing us to write just "valid_signin(user)" 
def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

# heres the implementation custom matcher, allowing us to write just "have_error_message" 
RSpec::Matchers.define :have_error_message do |message|						
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end