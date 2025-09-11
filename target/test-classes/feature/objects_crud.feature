Feature:Feature: CRUD operations on objects resource

  Background:
    * url baseUrl
    * def requestBody =  {id:'1', name: 'Apple mac Book Pro 16', data :{color:'Cloudy White',capacity:'128 GB'}}



  Scenario: Post -> get by id -> delete
    Given path 'objects'
    And request requestBody
    When method post
    Then status 200
    And match response contains { id:'#string',name:'#string',data:'##object'}
   * def name = response.name
    * def id = response.id

   # GET by ID
    Given path 'objects', id
    When method get
    Then status 200
    And match response.name == name
      # DELETE
    Given path 'objects' ,id
    When method delete
    Then status 200




