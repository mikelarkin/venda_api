module PowaApi
  class PowaService

    def self.get_publish_info
      client = Savon.client wsdl

      response = client.request :get_publish_info do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetPublishInfoRequest) do |xml|
             end
            end
          end
        end
      end

      response.to_array(:get_publish_info_response).first
    end

    protected

    def self.wsdl
      base_url + "PublishService?wsdl"
    end

    def self.base_url
      if ::PowaApi.config[:environment] == "production"
        "https://api.powa.com/ws/soap/v2/"
      else
        "https://api.sandbox.powa.com/ws/soap/v2/"
      end
    end

    def self.header_block(xml)
      xml.soapenv(:Header) do |xml|
        xml.urn(:Credentials) do |xml|
          xml.integrationSecurityKey ::PowaApi.config[:integration_security_key]
          xml.websiteAuthorisationToken ::PowaApi.config[:website_authorisation_token]
        end
      end
    end

    def self.namespaces
      {
        "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:urn" => "urn:powa:api:PowaAPI"
      }
    end
  end
end