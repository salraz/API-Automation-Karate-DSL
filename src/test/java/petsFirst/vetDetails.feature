Feature: Fetch vet details
Background: 
    * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
    * def bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjQ2LCJpYXQiOjE3MzY3NzQyODIsImV4cCI6MTc1MjMyNjI4Mn0.ZaP_v91t-79DcrhN4OZHt1kW2Qq0uxV6TagXSzlIk90'

Scenario: Fetch vet details
    Given path 'vets'
    And param clinicId = '4'
    And param packageId = '179'
    And param petType = '3'
    And param locale = 'en'
    * header Authorization = 'Bearer ' + bearerToken
    When method GET
    Then status 200
    * def vetId = response? .length > 0 ? response[0].id : null
    eval
    """
    if (vetId != null) {
        karate.log('Vet ID: ', vetId)
    } else {
        karate.log('No vet found')
    }
    """
