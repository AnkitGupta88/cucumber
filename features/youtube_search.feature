Feature: YouTube search function
  In order to watch a video
  As a Web user
  I want to be able to search per keyword

  Scenario: Search per keyword
    Given i have visited "www.youtube.com"
    When i enter "text adventure" in the search box
    And i submit the form
    Then i should see the "GET LAMP: The Text Adventure Documentary" result
