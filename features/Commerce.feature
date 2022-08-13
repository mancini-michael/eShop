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
    Given I am logged in
    When I click on the profile button
    And I click on the change button
    Then I can change my password

Scenario: As a user I want to be able to update my role so that I can became a SELLER

Scenario: As a user I want to display last purchases so that I can see my purchases history
    Given I am logged in
    When I click on the purchases button
    Then I display my purchases

Scenario: As a user I want to add items to my wishlist so that I can buy it in the future

Scenario: As a user I want to remove items from my wishlist so that I can update it

Scenario: As a user I want to add items in my shopping cart so that I can buy it

Scenario: As a user I want to remove items from my shopping cart so that I can update it

Scenario: As a user I want to review a seller of a sale so that people can share their sale experience

Scenario: As a user I want to make question for any item in selling list so that I can get further information about a selling item

Scenario: As a user I want to be able to search items so that I can display specific items

Scenario: As a user I want to block temporarily item so that I can organize a meeting with seller of item

