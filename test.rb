require 'rubygems'
require 'savon'
client = Savon::Client.new "https://api.sandbox.powa.com/ws/soap/v2/ProductService?wsdl"
#<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
#                  xmlns:urn="urn:powa:api:PowaAPI">
#<soapenv:Header>
#  <urn:Credentials>
#
#    <integrationSecurityKey>KEY-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</integrationSecurityKey>
#    <websiteAuthorisationToken>TOKEN-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</websiteAuthorisationToken>
#  </urn:Credentials>
#</soapenv:Header>
#<soapenv:Body>
#  <!-- APPROPRIATE REQUEST BODY HERE -->
#</soapenv:Body>
#</soapenv:Envelope>


namespaces = {
    "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
    "xmlns:urn" => "urn:powa:api:PowaAPI"
}
response = client.request :get_products do
  soap.xml do |xml|
    xml.soapenv(:Envelope, namespaces) do |xml|
      xml.soapenv(:Header) do |xml|
        xml.urn(:Credentials) do |xml|
          xml.integrationSecurityKey("KEY-6b05827d-e9c4-4d86-9c45-92394dfadf62")
          xml.websiteAuthorisationToken("TOKEN-03980096-5437-465a-8ce0-f6cd510c1f7a")
        end
      end
      xml.soapenv(:Body) do |xml|
        xml.urn(:GetProductsRequest) do |xml|
          xml.batchNumber(0)
        end
      end
    end
  end
end