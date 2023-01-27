@SoapFeaturePOST
Feature: Consultas de tipo SOAP

  @AssertTypeSOAP
  Scenario Outline: Parametrizando tipos <caso>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    #Por defecto se toma /json
    When header Content-Type = 'text/xml'
    And request
      """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
          <ubiNum><numero></ubiNum>
        </NumberToWords>
      </soap:Body>
    </soap:Envelope>
      """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<assert>'
    Examples:
      | caso       | numero | assert  |
      | Numero 333 | 333    | #string |
      | Numero 10  | 11     | #number |
      | Numero 250 | 250    | #object |

  @AssertTextSOAP
  Scenario Outline: Parametrizando text <caso>
    Given url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    #Por defecto se toma /json
    When header Content-Type = 'text/xml'
    And request
      """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
          <ubiNum><numero></ubiNum>
        </NumberToWords>
      </soap:Body>
    </soap:Envelope>
      """
    And method POST
    And match response/Envelope/Body/NumberToWordsResponse/NumberToWordsResult == '<assert> '
    Examples:
      | caso       | numero | assert                         |
      | Numero 333 | 333    | three hundred and thirty three |
      | Numero 10  | 10     | ten                            |
      | Numero 250 | 250    | two hundred and fifty          |
