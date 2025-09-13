Feature:Test CRUD operations on objects endpoint

  Background:
    * url baseUrl
  *  def id = '1'

  @regression @post
  Scenario: create /post
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

@get
  Scenario: Get object by id
    Given path 'objects', id
    When method get
    Then status 200
    * def Name = response.name
    * print 'Name:',Name

  @regression @cleanup
  Scenario:object cleanup
    Given path 'objects' ,id
    When method delete
    Then status 405

  @regression @delete
  Scenario:object delete
    Given path 'objects' ,id
    When method delete
    Then status 405
