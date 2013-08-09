Feature: Google Search
  As a user of Google Search 
  I want to be able to get relevant results for my search query
  In order to find what I'm looking for

    Scenario: Searching for a term
      Given I am on google.com
      When I enter "the answer to the question of life"
      Then I should see a list of results
      And I should see "42" in the results