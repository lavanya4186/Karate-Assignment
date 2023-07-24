Feature: Generate Pet Details Excel

  Background:
    * def pets = []
    * def totalPets = 30

  Scenario: Fill Pet Details in Excel
    Given table petData
      | "TestCasename" | "PetID" | "PetName" |
      | "TC001" | 1 | "DOG" |
      | "TC002" | 2 | "CAT" |
      | "TC003" | 3 | "ELEPHANT" |
      | "TC004" | 4 | "GOAT" |
      | "TC005" | 5 | "PIG" |
      | "TC006" | 6 | "MONKEY" |
      | "TC007" | 7 | "PUPPY" |
      | "TC008" | 8 | "HORSE" |
      | "TC009" | 9 | "HIPPO" |
      | "TC010" | 10 | "LION" |
      | "TC011" | 11 | "LEO" |
      | "TC012" | 12 | "TIGER" |
      | "TC013" | 13 | "PIGGY" |
      | "TC014" | 14 | "GIRAFFE" |
      | "TC015" | 15 | "HOG" |
      | "TC016" | 16 | "ZIB" |
      | "TC017" | 17 | "RAT" |
      | "TC018" | 18 | "HOY" |
      | "TC019" | 19 | "COW" |
      | "TC020" | 20 | "BAFFOLO" |
      | "TC021" | 21 | "ZOE" |
      | "TC022" | 22 | "MADD" |
      | "TC023" | 23 | "BEAR" |
      | "TC024" | 24 | "PANDA" |
      | "TC025" | 25 | "MOUSE" |
      | "TC026" | 26 | "DONKEY" |
      | "TC027" | 27 | "DINO" |
      | "TC028" | 28 | "SHARP" |
      | "TC029" | 29 | "DOVE" |
      | "TC030" | 30 | "PIGEON" |

    And def petDetails = karate.append(pets, petData)

    And def excelData = []
    And def headers = ['TestCasename', 'PetID', 'PetName']
    And karate.appendTo(excelData, headers)
    And karate.appendTo(excelData, petDetails)

    When def fileName = 'PetDetails.xlsx'
    And def filePath = java.nio.file.Paths.get('Desktop', fileName).toString()
    And karate.write(excelData, filePath)