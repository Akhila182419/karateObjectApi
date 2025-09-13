Feature:Feature: CRUD operations on objects resource

  Background:
    * url baseUrl

    * def id = 'ff8081819782e69e0199391b525c35c6'

  Scenario:  post- update--get by id

    # create (Post)
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
         "id": "21",
        "name": "vivo",
        "data": {
            "color": "Cloudy red",
            "capacity": "128 GB"
        }
    }"""
    When method put
    Then status 404
    * def Name = response.name
    * print 'Name:',Name


    # GET after UPDATE
    Given path 'objects', id
    When method get
    Then status 404
    * def Name = response.name
    * print 'Name:',Name
