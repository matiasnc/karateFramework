@FeaturePOST
Feature: Consultas de tipo POST

  Scenario: POST OK
    Given url 'https://reqres.in/api/users'
    When request { "name": "Felipe", "job": "Automation"}
    And method POST
    Then status 201

  Scenario: POST OK request entre comillas
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "Felipe",
    "job": "Automation"
    }
    """
    And method POST
    Then status 201

  Scenario: POST FAILED
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "Felipe",
    "job": "Automation"
    }
    """
    And method POST
    Then status 200

  @OutlinePOST
  Scenario Outline: Parametrizando <caso>
    Given url 'https://reqres.in/api/users'
    When request { "<name>": <vName>, "<job>": <vJob>}
    And method POST
    Then status 201
    Examples:
      | caso           | name | vName  | job | vJob         |
      | name completo  | name | "Mati" | job | "Automation" |
      | name vacio     | name |        | job | "Automation" |
      | name null      | name | null   | job | "Automation" |
      | sin campo name |      |        | job | "Automation" |
      | job completo   | name | "Mati" | job | "Automation" |
      | job vacio      | name | "Mati" | job | ""           |
      | job null       | name | "Mati" | job | null         |
      | sin campo job  | name | "Mati" |     | ""           |