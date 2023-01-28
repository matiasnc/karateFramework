@Regresion @jsonTestSOAP
Feature: Test con datos desde csv
  Scenario Outline: <caso>
    Given url 'https://reqres.in/api/users'
    When def body = read('dateRequest/jsonRest.json')
    And request body
    And method POST
    Then status 201
    Examples:
      |read('dateExamples/datosRest.csv')|