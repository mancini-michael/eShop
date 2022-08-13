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
    Given I am not logged in
    When I click on the Access button
    And I write my access_credentials
    Then I can be recognized as user

Scenario: As a guest I want to sign-in with Google so that I can be recognized as user

Scenario: As a guest I want to sign-in with Facebook so that I can be recognized as user

Scenario: As a user I want to have a personal area so that I can display my information
    Given I am logged in
    When I click on the profile button
    Then I should display my information

Scenario: As a user I want to be able to update my credentials so that I can change my password

Scenario: As a user I want to be able to update my role so that I can became a SELLER

Scenario: As a user I want to display last purchases so that I can see my purchases history

Scenario: As a user I want to add items to my wishlist so that I can buy it in the future

Scenario: As a user I want to remove items from my wishlist so that I can update it

Scenario: As a user I want to add items in my shopping cart so that I can buy it

Scenario: As a user I want to remove items from my shopping cart so that I can update it
