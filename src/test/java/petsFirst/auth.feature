Feature: Auth APIs for OTP verification
    Background:
    * url 'https://stage-petsfirst-backend.azurewebsites.net/api/'
    * def bearer  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjQ2LCJpYXQiOjE3MzY3NzQyODIsImV4cCI6MTc1MjMyNjI4Mn0.ZaP_v91t-79DcrhN4OZHt1kW2Qq0uxV6TagXSzlIk90'
    Scenario: Requesting the OTP on the provided phone number
    Given path 'auth/start-verify'
    And param locale = 'en'
    And request 
    """
    { 
    to: '923219672000' 
    }
    """
    When method Post
    Then status 200
    * def responseStatusCode = responseStatus
    * eval
  """
  if (responseStatusCode == 200) {
      karate.log('API call successful');
  } else {
      karate.log('Failure response');
  }
  """
  
    Scenario: Verifying the auth with OTP code
    Given path 'auth/check-verify'
    And param locale = 'en'
    And request { to: '923219672000', code: '5734' }
    When method Post
    Then status 200
    * def responseStatusCode = responseStatus
    * eval
  """
  if (responseStatusCode == 200) {
      karate.log('OTP Verified');
  } else { if (responseStatusCode == 400) {
      karate.log('Invalid OTP');
  } else { if (responseStatusCode == 404) {
      karate.log('OTP Expired');
  }
  }
  }
  """
