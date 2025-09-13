Feature: RESTful Objects API

  Background:
    * url baseUrl


  @positive
  Scenario: Get all objects
    Given path 'objects'
    When method get
    Then status 200
    * print response


  @positive@regression @post
  Scenario: Create a valid object
    Given path 'objects'
    And request
      """
      {
        "name": "Test Item",
        "data": {
          "color": "Blue",
          "price": 99.99
        }
      }
      """
    When method post
    Then status 200
    * def name = response.name
    And match response.name == name


  @negative
  Scenario: Create object with missing name
    Given path 'objects'
    And request
      """
      {
        "data": {
          "color": "Red"
        }
      }
      """

    When method post
    Then status 200
    * print 'Status:', responseStatus


  @negative
  Scenario: Get user with invalid ID
    Given path 'object', 'abc'
    When method get
    Then status 404
    * def error =
    """{
  "error": "Oject with id=abc was not found."
  }"""
    And match response contains { error: "#string"}


  @dataDriven
  Scenario Outline: Create multiple objects with dataset
    Given path 'objects'
    And request
      """
      {
        "name": "<name>",
        "data": {
          "color": "<color>",
          "price": <price>
        }
      }
      """
    When method post
    Then match response.name == '<name>'

    Examples:
      | name         | color     | price  |
      | Sample A     | Green     | 12.5   |
      | Another Item | Yellow    | 250.75 |
      | Edge Case    |           | 0.0    |
