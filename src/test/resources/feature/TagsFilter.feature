Feature:Test CRUD operations on objects endpoint

  Background:
    * url baseUrl
    * def id ='1'

  @smoke
  Scenario:Get by id
    Given path 'objects', id
    When method get
    Then status 200
    And def schemas = read('classpath:schema/Normal -getby id.json')
    And match response  == schemas

@crud
  Scenario:  Create - read-update - delete
     # create (Post)/Create User Schema
    Given path 'objects'
    And request
    """  {
        "name": "Pixel 9 Pro",
        "data": {
            "color": "Cloudy brown",
            "capacity": "132 GB"

        }
    }"""
    When method post
    Then status 200
    And def schemas = read('classpath:schema/User-Schema.json')
  And match response  == schemas
  * def id = response.id

      #Get object by id
    Given path 'objects', id
    When method get
    Then status 200
    * def Name = response.name
    * print 'Name:',Name

   # UPDATE (PUT)
  Given path 'objects',id
  And request
    """  {

        "name": "hp laptop",
        "data": {
            "color": " red",
            "capacity": "138 GB"
        }
    }"""
  When method put
  Then status 200
  And def schemas = read('classpath:schema/Update-Schema.json')
  And match response  == schemas

       #delete
    Given path 'objects',id
    When method delete
    Then status 200



  @update
   Scenario:Create - put - patch - delete

     # create (Post)/Create User Schema
    Given path 'objects'
    And request
    """  {
        "name": "dell laptop",
        "data": {
            "color": " brown and red",
            "capacity": "164 GB"

        }
    }"""
    When method post
    Then status 200
    And def schemas = read('classpath:schema/User-Schema.json')
    And match response  == schemas
    * def id = response.id

        # UPDATE (PUT)
    Given path 'objects',id
    And request
    """  {
        "name": "dell laptop",
        "data": {
            "color": " brown and red",
            "capacity": "164 GB",
            "processer":"i5"

        }
    }"""
    When method put
    Then status 200
    And def schemas = read('classpath:schema/Update-Schema.json')
    And match response  == schemas
    * def id = response.id

      # Edit (PATCH)
    Given path 'objects',id
    And request
    """  {
        "name": "dell laptop",
        "data": {
            "color": " brown and red",
            "capacity": "164 GB",
            "processer":"i5",
           "model":"2025"
        }
    }"""
    When method patch
    Then status 200
    And def schemas = read('classpath:schema/Update-Schema.json')
    And match response  == schemas
       #delete
    Given path 'objects' ,id
    When method delete
    Then status 405