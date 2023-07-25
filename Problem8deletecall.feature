Feature: Delete a Pet

  Background:
    * url 'https://petstore.swagger.io/v2/pet/560'

  Scenario: Delete a pet with a specific ID
    When method delete
    Then status 200
    And print 'Pet with ID: 560 deleted successfully.'
