@Regresion
Feature: Consultas de tipo DELETE

  Scenario: DELETE OK
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204