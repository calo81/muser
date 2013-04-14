Feature: Google log in
  In order to use Muser
  As a user
  I need to use my google login account

  Scenario: Login in
    Given I try to access the application
    When I login with a google account
    Then I can see the main page