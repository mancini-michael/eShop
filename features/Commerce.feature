Feature: Some User Stories

Scenario: As a guest I want to display the selling list so that I can see items for sale
    Given I am not logged in
    Then I display the items for sale

Scenario: As a guest I want to display details of any item so that I can see their information

Scenario: As a guest I want to display profile of any seller so that I can see their information

Scenario: As a guest I want to sign-up with email so that I can became a new user
    Given I am not logged in
    When I click on the Register button
    And I write my credentials
    Then I become a new User 

Scenario: As a guest I want to sign-up with Google so that I can became a new user

Scenario: As a guest I want to sign-up with Facebook so that I can became a new user

Scenario: As a guest I want to sign-in with email so that I can be recognized as user

Scenario: As a guest I want to sign-in with Google so that I can be recognized as user

Scenario: As a guest I want to sign-in with Facebook so that I can be recognized as user
