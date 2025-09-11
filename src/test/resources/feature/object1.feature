Feature:Feature: CRUD operations on objects resource

  Background:
    * url baseUrl

    * def id = 16


  Scenario: get by post- update
    # GET by ID
    #Given path 'objects', id
    #When method get
    #Then status 200
    #* def oldName = response.name
    #* print 'Old Name:', oldName

    # UPDATE (Post)
    Given path 'objects'
    And request
    """  {
        "id": "16",
        "name": "Pixel 6 Pro",
        "data": {
            "color": "Cloudy red",
            "capacity": "128 GB"
        }
    }"""
    When method post
    * def name = response.name
    Then status 200
    * def Name = response.name
    * print 'Name:',Name
    And match response.name == name


   # UPDATE (PUT)
    Given path 'objects'
    And request
    """  {

        "name": "Pixel 66 Pro",
        "data": {
            "color": "Cloudy red",
            "capacity": "128 GB"
        }
    }"""
    When method put
    Then status 405
    * def Name = response.timestamp
    * print 'Name:',Name


    # GET after UPDATE
    Given path 'objects', id
    When method get
    Then status 404
    * def Name = response.timestamp
    * print 'Name:',Name
