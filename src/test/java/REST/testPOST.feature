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
      | Name completo  | name | "Mati" | job | "Automation" |
      | Name vacio     | name |        | job | "Automation" |
      | Name null      | name | null   | job | "Automation" |
      | Sin campo name |      |        | job | "Automation" |
      | Job completo   | name | "Mati" | job | "Automation" |
      | Job vacio      | name | "Mati" | job | ""           |
      | Job null       | name | "Mati" | job | null         |
      | Sin campo job  | name | "Mati" |     | ""           |