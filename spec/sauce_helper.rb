# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"
require "sauce/capybara"

# Configure your desired test platforms
# For available platforms check out https://saucelabs.com/docs/platforms
Sauce.config do |config|
  config[:browsers] = [
    ["Windows 8", "Internet Explorer", "10"],             
    ["Windows 7", "Internet Explorer", "9"],
    # ["Windows 7", "Internet Explorer", "8"],
    ["Windows 7", "Firefox", "23"],
    ["OS X 10.8", "Safari", "6"],
    ["Linux", "Chrome", nil]  
  ]
end
