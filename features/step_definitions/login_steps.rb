Given(/^I am about to login$/) do
  page(LoginPage).await(30)
  page(LoginPage).self_hosted_site
end

When(/^I enter invalid credentials$/) do
  user = CREDENTIALS[:invalid_user]

  page(LoginPage).login(user[:username], user[:password], CREDENTIALS[:site])
end

Then(/^I am presented with an error message to correct credentials$/) do
  #TODO
end

When(/^I enter valid credentials$/) do
  user = CREDENTIALS[:valid_user]

  page(LoginPage).login(user[:username], user[:password], CREDENTIALS[:site])
end

Then(/^I am successfully authenticated$/) do
  page(SitePage).await
end

When(/^I can see posts for the site$/) do
  page(SitePage).to_posts
end

Given(/^I am on the first experience screen$/) do
  page(LoginPage).await(30)
end

When(/^I choose to get more information$/) do
  page(LoginPage).more_information
end

Then(/^I am taking to the information screen$/) do
  page(InfoPage).assert_info_present
end

Then(/^I am able to create an account$/) do
  page(LoginPage).assert_can_create_account
end