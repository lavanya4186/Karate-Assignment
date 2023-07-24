Feature: Create a Pet

  Background:
    * url 'https://petstore.swagger.io/v2/pet'

  Scenario: Create a new pet
    Given request
  """
  {
    "id": 545,
    "name": "Doggie",
    "status": "available"
  }
  """
    When method post
    Then status 200
    And match response == {"id":545,"name":"Doggie","photoUrls":[],"tags":[],"status":"available"}
    And print 'Pet created successfully! ID:', response.id