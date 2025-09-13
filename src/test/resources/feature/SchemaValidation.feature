Feature: API Schema Validation

  Background:
    * url baseUrl

  Scenario: create post- get by id - Error Response Schema == schema validation

     # create (Post)/Create User Schema
    Given path 'objects'
    And request
    """  {
        "id": "21",
        "name": "Pixel 8 Pro",
        "data": {
            "color": "Cloudy brown",
            "capacity": "128 GB",
            "model": "123.54"
        }
    }"""
    When method post
    * def name = response.name
    Then status 200
    * def Name = response.name
    And match response.name == name
    * def id = response.id

      # get by id/
    Given path 'objects', id
    When method get
    Then status 200
    * def Name = response.name
    * print 'Name:',Name


  Scenario: Request not  user and validate error schema
    Given path 'users', '9999'
    When method get
    Then status 404
    * def errorSchema =
      """
      {"timestamp":"2025-09-13T06:58:20.704+00:00","status":404,"error":"Not Found","path":"/users/9999"}
      """
    And match response contains { timestamp: "#string",status: "#number",error: "#string",path: "##string"}








