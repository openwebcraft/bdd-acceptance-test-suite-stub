# bdd-acceptance-test-suite-stub

The stub for a *Behavior Driven Development* (BDD) Acceptance Test Suite using [Cucumber] + [Capybara] + [Selenium WebDriver].

## Prerequisits

You need [Ruby] and [Bundler] installed.

**Note:** If you're using [Ruby Version Manager (RVM)]: the project ships with a `.rmvrc` file that will require `ruby-1.9.3-p448` and assures that a project-specific gemset exists.

## Usage

    git clone git@github.com:openwebcraft/bdd-acceptance-test-suite-stub.git
    cd bdd-acceptance-test-suite-stub
    bundle install
    bundle exec cucumber

The above should produce an output that looks like this:

    Feature: Google Search
      As a user of Google Search
      I want to be able to get relevant results for my search query
      In order to find what I'm looking for
    
      Scenario: Searching for a term                      # features/google/google_search.feature:6
        Given I am on google.com                          # features/step_definitions/google_steps.rb:1
        When I enter "the answer to the question of life" # features/step_definitions/google_steps.rb:5
        Then I should see a list of results               # features/step_definitions/google_steps.rb:9
        And I should see "42" in the results              # features/step_definitions/google_steps.rb:13
    
    1 scenario (1 passed)
    4 steps (4 passed)
    0m9.440s


[Ruby]: http://www.ruby-lang.org/ "Ruby"
[Bundler]: http://bundler.io/ "Bundler"
[Ruby Version Manager (RVM)]: https://rvm.io/ "RVM"
[Cucumber]: http://cukes.info/ "Cucumber"
[Capybara]: http://jnicklas.github.io/capybara/ "Capybara"
[Selenium WebDriver]: http://docs.seleniumhq.org/ "Selenium WebDriver"