module VendaApi
  class VendaService

    def self.get_publish_info
      client = Savon.client wsdl

      response = client.request :get_publish_info do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|
            xml.soapenv(:Body) do |xml|
              header_block(xml)
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

    def self.security_block(xml)
      xml.email ::VendaApi.config[:email]
      xml.password ::VendaApi.config[:password]
    end

    def self.namespaces
      {
        "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:soapenc" => "http://schemas.xmlsoap.org/soap/encoding/",
        "xmlns:types" => "urn:VendaProducts/encodedTypes",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema"
      }
    end
  end
end
