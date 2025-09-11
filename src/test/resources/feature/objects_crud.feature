Feature: CRUD operations on objects resource

  Background:
    * url baseUrl
    * def requestBody = { data: { name: 'TestObject', value: '123' } }
    * def createdId = 1


  Scenario: Create a new object
    Given path 'objects'
    And request requestBody
    When method post
    Then status 200
    And match response contains { id: '#string', data: '#object' }


  Scenario: Read the created object
    Given path 'objects', createdId
    When method get
    Then status 200
    And match response.id != createdId
    And match response.name == 'Google Pixel 6 Pro'
    And match response.data.value == '128 GB'

  Scenario: Delete the object
    Given path 'objects', createdId
    When method delete
    Then status 200

  Scenario: Cleanup
    Given path 'objects', createdId
    When method get
    Then status 200
