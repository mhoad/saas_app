require 'rails_helper'
require 'helpers/session_helpers'

RSpec.configure do |c|
  c.include Features::SessionHelpers
end

describe "The sign up process", :type => :feature do
  scenario 'visitor can sign up with valid email address and password' do
    sign_up_with('test@example.com', 'please123', 'please123')
    txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  scenario 'visitor cannot sign up with invalid email address' do
    sign_up_with('bogus', 'please123', 'please123')
    expect(page).to have_content 'Email is invalid'
  end

  scenario 'visitor cannot sign up without password' do
    sign_up_with('test@example.com', '', '')
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'visitor cannot sign up with a short password' do
    sign_up_with('test@example.com', 'please', 'please')
    expect(page).to have_content "Password is too short"
  end

  scenario 'visitor cannot sign up without password confirmation' do
    sign_up_with('test@example.com', 'please123', '')
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    sign_up_with('test@example.com', 'please123', 'mismatch')
    expect(page).to have_content "Password confirmation doesn't match"
  end
end