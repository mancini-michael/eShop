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
    Given I am logged in
    When I click on the 'Diventa un venditore'
    Then I can change my role

Scenario: As a user I want to display last purchases so that I can see my purchases history
    Given I am logged in
    When I click on the purchases button
    Then I display my purchases

Scenario: As a user I want to add items in my shopping cart so that I can buy it
    Given I am logged in
    When I click on the plus button
    Then I display that item in the shopping cart

Scenario: As a user I want to remove items from my shopping cart so that I can update it
    Given I am logged in
    When I display the shopping cart
    And I click on the minus button
    Then I should remove that item from the shopping cart

Scenario: As a user I want to review a seller of a sale so that people can share their sale experience
    Given I am logged in
    When I click on a seller's name
    And I click on the review button
    And I fill the form
    Then I should see my review

Scenario: As a user I want to make question for any item in selling list so that I can get further information about a selling item
    Given I am logged in
    When I click any insertion
    And I fill the form for my question
    Then I should see my question

Scenario: As a user I want to be able to search items so that I can display specific items
    Given I am logged in
    When I click write the item's name in the search bar
    And I press the search button
    Then I display that item

Scenario: As a user I want to select a place from a map and to set a meeting hour for a blocked item so that I can organize a meeting with the seller to finalize the sale
    Given I am logged in
    When I click any insertion
    And I click on 'Prenota un incontro'
    And I fill the meeting form
    Then I should have organized a meeting

Scenario: As a user I want to accept meeting place and hour so that I can meet seller to complete the sale
    Given I am logged in
    When I click any insertion
    And I click on 'Prenota un incontro'
    And I fill the meeting form
    And the seller change place and hour
    Then I can accept the changes

Scenario: As a user I want decline meeting place and hour so that I can ask to seller a new one 
    Given I am logged in
    When I click any insertion
    And I click on 'Prenota un incontro'
    And I fill the meeting form
    And the seller change place and hour
    Then I can decline the changes

Scenario: As a seller I want to have a personal area so that I can display my information
    Given I am logged in
    When I click on the profile button
    Then I should display my information

Scenario: As a seller I want to be able to update my credentials so that I can change my password
    Given I am logged in as a seller
    When I click on the profile button
    And I click on the change button
    Then I can change my password

Scenario: As a seller I want to be able to update my role so that I can became an USER
    Given I am logged in as a seller
    When I click on Fai una pausa dalle vendite
    Then I bacame an user

Scenario: As a seller I want to display my selling list so that I can see the items I've listed
    Given I am logged in as a seller
    When I click on the profile button
    And I click on Visualizza annunci
    Then I should display my selling list

Scenario: As a seller I want to display my sold list so that I can see the items I've sold
    Given I am logged in as a seller
    When I sell an item
    Then I should display that item in my sold list

Scenario: As a seller I want to add an item for sale so that I can sale items on the application
    Given I am logged in as a seller
    When I click on the profile button
    And I click on the button to add an item for sale
    And I fill the form to add the item
    Then I should see that item in my selling list

Scenario: As a seller I want to remove an item for sale so that I can remove items in not longer interested to sale 
    Given I am logged in as a seller
    When I click on the profile button
    And I click on the button to remove an item for sale
    Then I should not see that item in my selling list

Scenario: As a seller I want to answer to the questions I received on the items on sale so that I can provide additional information to the interested users
    Given I am logged in as a seller
    When I click on an item in my selling list
    And I display the question I received for that item
    Then I can answer to it 

Scenario: As a seller I want to display reviews I received so that I can improve my service
    Given I am logged in as a seller
    When I click on the profile button
    Then I should display the reviews I received

Scenario: As a seller I want to decline meeting place and hour so that I can ask to user a new one
    Given I am logged in as a seller
    When I click on Prenotazioni
    Then I should decline meeting place and hour

Scenario: As a seller I want to accept meeting place and hour so that I can meet user to complete the sale
    Given I am logged in as a seller
    When I click on Prenotazioni
    Then I should accept meeting place and hour

Scenario: As a seller I want to close sale of any items after meeting with user so that I can update my selling list
    Given I am logged in as a seller
    When I click on Prenotazioni
    Then I should conclude the sale
