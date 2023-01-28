@Regresion @SoapFeaturePOST @ReadXml
Feature: Consultas de tipo SOAP

  @AssertTypeSOAP
  Scenario Outline: Parametrizando XML <caso>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    #Por defecto se toma /json
    When header Content-Type = 'text/xml'
    And def bodyXml = read('dateExamples/xmlTest.xml')
    And request bodyXml
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<assert> '
    Examples:
      | caso       | numero | assert                         |
      | Numero 333 | 333    | three hundred and thirty three |
      | Numero 10  | 10     | ten                            |
      | Numero 250 | 250    | two hundred and fifty          |