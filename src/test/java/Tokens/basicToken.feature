@Regresion @Tokens
Feature: GET Basic and Bearer Token

  @TokenBasic
  Scenario: Authentication Basic
    Given url 'https://postman-echo.com/basic-auth'
    When header Authorization = call read('utilJs/tokenBasic.js') {username:'postman', password:'password'}
    And method GET
    Then status 200

  @TokenBearer
  Scenario: Authentication Bearer
    Given url 'https://api.github.com/user/repos'
    When header Authorization = 'Bearer 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'
    And method GET
    Then status 200