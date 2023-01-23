Feature: Consultas de tipo GET

  Scenario: GET OK number
    Given url 'https://reqres.in/api/users/2'
    * header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 60000
    * configure readTimeout = 60000
    When method GET
    Then status 200
    And match response.data.id == 2

  Scenario: GET Tipo number
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.id == '#number'

  Scenario: GET FAILED number
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.id == 3

  Scenario: GET OK first name
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.first_name == 'Janet'

  Scenario: GET String first name
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.first_name == '#string'

  Scenario: GET FAILED first name
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.first_name == 'Felipe'