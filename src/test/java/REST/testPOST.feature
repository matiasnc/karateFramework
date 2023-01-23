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