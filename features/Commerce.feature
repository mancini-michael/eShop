Feature: Some User Stories

Scenario: As a guest I want to display the selling list so that I can see items for sale
    Given I am not logged in
    Then I display the items for sale

Scenario: As a guest I want to display details of any item so that I can see their information
    Given I am not logged in
    When I click any insertion
    Then I display the information of item

Scenario: As a guest I want to display profile of any seller so that I can see their information
    Given I am not logged in
    When I click any seller
    Then I display the page of seller

Scenario: As a guest I want to sign-up with email so that I can became a new user
    Given I am not logged in
    When I click on the Register button
    And I write my credentials
    Then I become a new User 

Scenario: As a guest I want to sign-in with email so that I can be recognized as user
    Given I am not logged in
    When I click on the Access button
    And I write my access_credentials
    Then I can be recognized as user

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

Scenario: As a user I want to add items in my shopping cart so that I can buy it

Scenario: As a user I want to remove items from my shopping cart so that I can update it

Scenario: As a user I want to review a seller of a sale so that people can share their sale experience

Scenario: As a user I want to make question for any item in selling list so that I can get further information about a selling item

Scenario: As a user I want to be able to search items so that I can display specific items
    Given I am logged in
    When I click write the item's name in the search bar
    And I press the search button
    Then I display that item

Scenario: As a user I want to select a place from a map and to set a meeting hour for a blocked item so that I can organize a meeting with the seller to finalize the sale

Scenario: As a user I want to accept meeting place and hour so that I can meet seller to complete the sale

Scenario: As a user I want decline meeting place and hour so that I can ask to seller a new one 

Scenario: As a user I want to my accepted selling meeting synchronized with my Google Calendar so that I can display the event on the google calendar

Scenario: As a seller I want to have a personal area so that I can display my information
    Given I am logged in
    When I click on the profile button
    Then I should display my information

Scenario: As a seller I want to be able to update my credentials so that I can change my password
    Given I am logged in
    When I click on the profile button
    And I click on the change button
    Then I can change my password

Scenario: As a seller I want to be able to update my role so that I can became an USER

Scenario: As a seller I want to display my selling list so that I can see the items I've listed

Scenario: As a seller I want to display my sold list so that I can see the items I've sold

Scenario: As a seller I want to add an item for sale so that I can sale items on the application

Scenario: As a seller I want to remove an item for sale so that I can remove items in not longer interested to sale 

Scenario: As a seller I want to answer to the questions I received on the items on sale so that I can provide additional information to the interested users

Scenario: As a seller I want to display reviews I received so that I can improve my service

Scenario: As a seller I want to decline meeting place and hour so that I can ask to user a new one

Scenario: As a seller I want to accept meeting place and hour so that I can meet user to complete the sale

Scenario: As a seller I want to close sale of any items after meeting with user so that I can update my selling list


