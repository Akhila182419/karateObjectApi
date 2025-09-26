Feature: Negative Testing for User API

  Background:
    * url baseUrl

  Scenario: Get user with invalid ID
    Given path 'object', 'abc'
    When method get
    Then status 404
    * def error =
    """{
  "error": "Object with id=abc was not found."
  }"""
    And match response contains { error: "#string"}

# payload case
  Scenario: Successfully create a new user with valid payload
    Given path 'object'
    And request
      """
      {
        "name": vivo pro,
    }
      """
    When method post
    Then status 404
    * def errorSchema =
      """
      {"timestamp":"2025-09-13T06:58:20.704+00:00","status":404,"error":"Not Found","path":"/users/9999"}
      """
    And match response contains { timestamp: "#string",status: "#number",error: "#string",path: "##string"}

## mulitple data invalid payload
  Scenario: Successfully create a user mulitple data with invalid payload
    Given path 'object'
    And request
      """
      {
        "name": vivo pro,
       "data": {
            "color": "Cloudy brown",
            "capacity": "128 GB",
            "model": "123.54987TP"
    }}
      """
    When method post
    Then status 404
    * def errorSchema =
      """
      {"timestamp":"2025-09-13T06:58:20.704+00:00","status":404,"error":"Not Found","path":"/users/9999"}
      """
    And match response contains { timestamp: "#string",status: "#number",error: "#string",path: "##string"}






