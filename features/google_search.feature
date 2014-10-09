Feature: Google search functionality
  In order to consume a Web page
  As a Web user
  I want to be able to search by keyword

  Scenario: search by keyword
    Given i visit the "www.google.com" page
    When i enter the "01Gen" keyword in the search form
    And i click on the submit button
    Then i should see the "Yamaha 01GEN | EICMA" result
