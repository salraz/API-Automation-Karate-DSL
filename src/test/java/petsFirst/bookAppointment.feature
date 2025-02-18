Feature: PetsFirst API Automation
  Background:
  * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
  * def bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjQ2LCJpYXQiOjE3MzY3NzQyODIsImV4cCI6MTc1MjMyNjI4Mn0.ZaP_v91t-79DcrhN4OZHt1kW2Qq0uxV6TagXSzlIk90'

  
  Scenario: Book an appointment with a clinic
  * def petId = 2562
  Given path 'appointments'
  And param locale = 'en'
  And header dubaitime = 'true'
  And header discount = 'true'
  * header Authorization = 'Bearer ' + bearerToken
  And request 
  """
  {
    "name": "Consultation",
    "clinicId": 4,
    "petId": petId,
    "symptoms": [
        "Cold",
        "Cough",
        "Diarrhea",
        "Nausea"
    ],
    "symptomsDescription": "",
    "startTime": "2025-02-18T06:00:00.000Z",
    "vetId": 26,
    "priceId": 407,
    "serviceType": "Clinic",
    "addressId": null,
    "ofset": "5",
    "currentDate": "2025-02-12T09:34:45.330Z",
    "packageId": 375,
    "dId": 19
  }
  """
  When method POST
  Then status 200
  Given path 'appointments'
  And param locale = 'en'
  And header dubaitime = 'true'
  And header discount = 'true'
  * header Authorization = 'Bearer ' + bearerToken

  Scenario: Reschedule an appointment
    Given path 'appointments/1304'
    And param locale = 'en'
    * header Authorization = 'Bearer ' + bearerToken
    And request 
    """
    {
      "data": {
          "startTime": "2024-02-19T12:00:00.000Z",
          "ofset": "5"
      }
    }
    """
    When method PUT
    Then status 200
    * def responseStatusCode = responseStatus
    * eval
  """
  if (responseStatusCode == 200) {
      karate.log('Appointment rescheduled successfully');
  } else {
      karate.log('Failed to reschedule appointment');
  }
  """

  # Scenario: Cancel an appointment
  #   Given path 'appointments'
  #   And param locale = 'en'
  #   * header Authorization = 'Bearer ' + bearerToken
  #   When method DELETE
  #   Then status 200
  #   * def responseStatusCode = responseStatus
  #   * eval
  # """
  # if (responseStatusCode == 200) {
  #     karate.log('Appointment cancelled successfully');
  # } else {
  #     karate.log('Failed to cancel appointment');
  # }
  # """
    