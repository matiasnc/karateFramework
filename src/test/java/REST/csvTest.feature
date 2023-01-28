@csvTestSOAP
Feature: Test con datos desde csv
  Scenario Outline: <caso>
    Given url 'https://reqres.in/api/users'
    When request { "<name>": <vName>, "<job>": <vJob>}
    And method POST
    Then status 201
    Examples:
      |read('examples/datosRest.csv')|