module VendaApi
  class VendaService

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
      if ::VendaApi.config[:environment] == "production"
        "https://api.venda.com/ws/soap/v2/"
      else
        "https://api.sandbox.venda.com/ws/soap/v2/"
      end
    end

    def self.header_block(xml)
      xml.soapenv(:Header) do |xml|
        xml.urn(:Credentials) do |xml|
          xml.integrationSecurityKey ::VendaApi.config[:integration_security_key]
          xml.websiteAuthorisationToken ::VendaApi.config[:website_authorisation_token]
        end
      end
    end

    def self.namespaces
      {
        "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:urn" => "urn:venda:api:VendaAPI"
      }
    end
  end
end