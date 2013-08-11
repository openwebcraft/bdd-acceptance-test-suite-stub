# bdd-acceptance-test-suite-stub

The stub for a *Behavior Driven Development* (BDD) Acceptance Test Suite using [Cucumber] + [Capybara] + [Selenium WebDriver] + [RSpec] \[+ [Sauce Labs], optional\].

## Prerequisits

You need [Ruby] and [Bundler] installed.

**Note:** If you're using a ruby manager (e.g. [Ruby Version Manager (RVM)]): the project ships with `.ruby-version` and `.ruby-gemset` files that will require `ruby-1.9.3-p448` and assures that a project-specific gemset (`bdd-acceptance-test-suite-stub`) exists.

In order to run your tests on the [Sauce Labs] Cloud Testing Platform you need to have a [Sauce Labs] account.

## Usage

### Initial Setup (one-time)

    git clone git@github.com:openwebcraft/bdd-acceptance-test-suite-stub.git
    cd bdd-acceptance-test-suite-stub
    bundle install

### Writing your tests

1. Describe behaviour in plain text, e.g. `features/google/google_search.feature`.
2. Write a step definition in Ruby, e.g. `features(step_definitions/google_steps.rb`). Good starting point for newbies: [Step Definitions](http://cukes.info/step-definitions.html) (Cucumber Wiki).
3. Run and watch it fail...
4. Write code to make the step pass...
5. Run again and see the step pass
6. Repeat 2-5 until all green. :-)

### Running your tests locally

Run your tests with:

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

### Running your tests on Sauce Labs

The project ships with a ready to use integration with [Sauce Labs] - a Mobile and Web App Cloud Testing Platform.

In order to run your tests on [Sauce Labs] you need to set up the Sauce Gem.

By adding the [Sauce Labs] credentials as environment variables your keeping them out of your repositories and available to all your [Sauce Labs] tools using projects.

Open `~/.bash_profile` and add the following lines:

export SAUCE_USERNAME=<username>
export SAUCE_ACCESS_KEY=<access_key>

You'll then need to re-load that profile with `source ~/.bash_profile`.

The integration is enabled by way of the `@selenium` tag in [Cucumber]. So edit your `*.features` files and add the tag to each of the Features you would like to test using [Sauce Labs]. E.g. for the **Feature: Google Search** in  `features/google/google_search.feature`:

    @selenium
    Feature: Google Search
      As a user of Google Search 
      I want to be able to get relevant results for my search query
      In order to find what I'm looking for
    
        Scenario: Searching for a term
          Given I am on google.com
          When I enter "the answer to the question of life"
          Then I should see a list of results
          And I should see "42" in the results 

Run your tests with:

    bundle exec cucumber

The above should then produce an output that looks like this:

    @selenium
    Feature: Google Search
      As a user of Google Search
      I want to be able to get relevant results for my search query
      In order to find what I'm looking for
    
      Scenario: Searching for a term                      # features/google/google_search.feature:7
    [Connecting to Sauce Labs...]
        Given I am on google.com                          # features/step_definitions/google_steps.rb:1
        When I enter "the answer to the question of life" # features/step_definitions/google_steps.rb:5
        Then I should see a list of results               # features/step_definitions/google_steps.rb:9
        And I should see "42" in the results              # features/step_definitions/google_steps.rb:13
        Given I am on google.com                          # features/step_definitions/google_steps.rb:1
        When I enter "the answer to the question of life" # features/step_definitions/google_steps.rb:5
        Then I should see a list of results               # features/step_definitions/google_steps.rb:9
        And I should see "42" in the results              # features/step_definitions/google_steps.rb:13
        Given I am on google.com                          # features/step_definitions/google_steps.rb:1
        When I enter "the answer to the question of life" # features/step_definitions/google_steps.rb:5
        Then I should see a list of results               # features/step_definitions/google_steps.rb:9
        And I should see "42" in the results              # features/step_definitions/google_steps.rb:13
        Given I am on google.com                          # features/step_definitions/google_steps.rb:1
        When I enter "the answer to the question of life" # features/step_definitions/google_steps.rb:5
        Then I should see a list of results               # features/step_definitions/google_steps.rb:9
        And I should see "42" in the results              # features/step_definitions/google_steps.rb:13
    
    1 scenario (1 passed)Sauce Labs: Supported Device, OS, and Browser Platforms
    2m32.169s

You can configure your desired test platforms in the file `spec/sauce_helper.rb`.

For available platforms check out [Sauce Labs: Supported Device, OS, and Browser Platforms](https://saucelabs.com/docs/platforms).

[Ruby]: http://www.ruby-lang.org/ "Ruby"
[Bundler]: http://bundler.io/ "Bundler"
[Ruby Version Manager (RVM)]: https://rvm.io/ "RVM"
[Cucumber]: http://cukes.info/ "Cucumber"
[Capybara]: http://jnicklas.github.io/capybara/ "Capybara"
[Selenium WebDriver]: http://docs.seleniumhq.org/ "Selenium WebDriver"
[RSpec]: http://rspec.info/ "RSpec"
[Sauce Labs]: https://saucelabs.com/ "Sauce Labs"