Given /^I am on google\.com$/ do
  visit('/')
end

When /^I enter "([^"]*)"$/ do |term|
  fill_in('q',:with => term)
end

Then(/^I should see a list of results$/) do
  page.has_selector? "ol#rso"
end

Then(/^I should see "(.*?)" in the results$/) do |text|
  page.has_text? text
end