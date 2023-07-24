Feature: CREATE PET|VALIDATE PET|DELETE PET E2E FLOW

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2/pet'

  Scenario Outline: Create, Validate, and Delete a Pet
    * def createPetRequest =
  """
  {
    "id": "#(petId)",
    "name": "#(petName)",
    "status": "available"
  }
  """
    * def response = karate.callSingle(baseUrl, createPetRequest)
    * match response.status == 200
    * match response.response.id == petId
    * print 'Created Pet:', response.response

    * def validateResponse = karate.callSingle(baseUrl + '/' + petId, null, { method: 'get' })
    * match validateResponse.status == 200
    * match validateResponse.response.id == petId
    * match validateResponse.response.name == petName
    * print 'Validated Pet:', validateResponse.response

    * def deleteResponse = karate.callSingle(baseUrl + '/' + petId, null, { method: 'delete' })
    * match deleteResponse.status == 200
    * print 'Deleted Pet with ID:', petId

    Examples:
      | petId | petName       |
      | 123   | Doggie        |
      | 456   | Kitty         |
      | 789   | Fluffy        |
