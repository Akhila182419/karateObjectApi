Feature: CRUD operations on objects resource

  Background:
    * url baseUrl
    * def requestBody =  { name: 'Apple mac Book Pro 16', data :{year: '2025',price:'300000',CPU model:'Intel Core m5',Hard disk size: '2 B'}}



  Scenario: Post -> get by id -> delete
    Given path 'objects'
    And request requestBody
    When method post
    Then status 200
    And match response contains { id: '#string',name: '#string',createdAt: '#string', data: '##object' }
     * def id = response.id

    Given path 'objects',id
    When method get
    Then status 200
    And match response.id == id

    Given path 'objects',id
    When method delete
    Then status 200

 
