Feature: Fetching the details of all the pets.

Scenario: Fetch Details of a Pet with ID #
    Given path 'pets/2562'
    And param locale = 'en'
    * header Authorization = 'Bearer ' + bearerToken
    When method GET
    Then status 200
    And match response.
    * def petName = response.name
    * def petID = response.id
