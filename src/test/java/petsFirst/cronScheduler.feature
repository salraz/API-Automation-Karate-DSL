Feature:
    Background:
    * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
    * def bearer 

Scenario: Cron appointment sync
    Given path '/cron/users'
    * def currentDate = new Date().toISOString().split('T')[0]
    And request { "unitOfTime": "days", "duration": 4, "startDate": currentDate }
    When method GET
    Then status 200