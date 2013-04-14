Given /^I try to access the application$/ do
 step 'I go to the home page'
end

When /^I login with a google account$/ do
  step 'I fill in "Email" with "muser.app1@gmail.com"'
  step 'I fill in "Passwd" with "muser_app"'
  step 'I press "signIn"'
  step 'I press "submit_approve_access"'
end

Then /^I can see the main page$/ do
  step 'I should see "Muser"'
end