Feature: Validate a Pet

  Background:
    * url 'https://petstore.swagger.io/v2/pet/560'

  Scenario: Validate if the pet is created using GET

    When method get
    Then status 200
    And match response == {"id":560,"name":"Doggies","photoUrls":[],"tags":[],"status":"available"}
    And print 'Pet created successfully! Response Code:', responseStatus
    And print 'Pet with ID: 560 exists.'