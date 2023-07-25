Feature: Getting PetData from Excel

  Background:
    * def ExcelReader = Java.type('support.Exclereader')

  Scenario Outline: Get Pet ID and Name based on Test Case Name
    * def testCaseName = '<testCaseName>'
    * def testData = ExcelReader.getPetData(testCaseName)
    * print 'Test Case Name:', testCaseName
    * print 'Pet ID:', testData.getPetId()
    * print 'Pet Name:', testData.getPetName()

    Examples:
      | testCaseName |
      | TC_001       |
      | TC_022       |
      | TC_029       |
      | TC_009       |



