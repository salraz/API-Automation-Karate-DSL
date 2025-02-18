Feature:
Background:
    * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
    * def bearerToken  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjQ2LCJpYXQiOjE3MzY3NzQyODIsImV4cCI6MTc1MjMyNjI4Mn0.ZaP_v91t-79DcrhN4OZHt1kW2Qq0uxV6TagXSzlIk90'

Scenario: Update User Address
    Given path 'users'
    And param locale = 'en'
    And path id = 355
    And request 
    """
    {
    "name": "Mohsin",
    "email": "muhammad.mohsin@glowfishlabs.com"
    }
    """
    * header Authorization = 'Bearer ' + bearerToken
    When method POST
    Then status 200
