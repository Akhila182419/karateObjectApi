Feature:Feature: CRUD operations on objects resource

  Background:
    * url baseUrl

  Scenario:  post- update--get by id

    # create (Post)
    Given path 'objects'
    And request

    """  {
        "name": "iphone",
        "data": {
            "color": "Cloudy white",
            "capacity": "132 GB"
        }
    }"""
    When method post
    Then status 200
    And def schemas = read('classpath:schema/User-Schema.json')
    And match response  == schemas
    * def Name = response.name
    * print 'Name:',Name
    * def id = response.id

   # UPDATE (PUT)
    Given path 'objects',id
    And request
    """   {
        "name": "iphone",
        "data": {
            "color": "Cloudy white",
            "capacity": "132 GB",
            "model":"2025"
        }
    }"""
    When method put
    Then status 200
    And def schemas = read('classpath:schema/Update-Schema.json')
    And match response  == schemas
    * def Name = response.name
    * print 'Name:',Name



    # GET after UPDATE
    Given path 'objects', id
    When method get
    Then status 200
    * def Name = response.name
    * print 'Name:',Name
