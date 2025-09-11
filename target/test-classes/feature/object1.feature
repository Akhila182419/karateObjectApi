Feature:Feature: CRUD operations on objects resource

  Background:
    * url baseUrl

    * def id = 'ff8081819782e69e0199391b525c35c6'

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
        "id": "20",
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
    Given path 'objects',id
    And request
    """  {

        "name": "vivo",
        "data": {
            "color": "Cloudy red",
            "capacity": "128 GB"
        }
    }"""
    When method put
    Then status 200
    * def Name = response.name
    * print 'Name:',Name


    # GET after UPDATE
    Given path 'objects', id
    When method get
    Then status 200
    * def Name = response.name
    * print 'Name:',Name
