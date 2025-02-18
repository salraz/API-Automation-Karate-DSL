Feature:
    Background:
    * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
    * def bearer = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjQ2LCJpYXQiOjE3MzY3NzQyODIsImV4cCI6MTc1MjMyNjI4Mn0.ZaP_v91t-79DcrhN4OZHt1kW2Qq0uxV6TagXSzlIk90'

Scenario: Check for nearby clinics.
    Given path 'clinic/nearby'
    And param lat = '31.463274'
    And param lng = '74.389222'
    And param locale = 'en'
    And header ismobileclinic = 'true'
    * header Authorization = 'Bearer ' + bearerToken
    When method GET
    Then status 200
    * def clinicID = response?.length > 0 ? response[0].id : null
    * eval
    """
    if (clinicID != null) {
        karate.log('Clinic ID: ', clinicID)
    } else {
        karate.log('No clinic found')
    }
    """
