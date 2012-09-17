module PowaApi
  class PowaService

    def self.config
      Config.default
    end

    protected

    def self.base_url
      if config.environment == "production"
        "https://api.powa.com/ws/soap/v2/"
      else
        "https://api.sandbox.powa.com/ws/soap/v2/"
      end
    end

    def self.header_block(xml)
      xml.soapenv(:Header) do |xml|
        xml.urn(:Credentials) do |xml|
          xml.integrationSecurityKey config.integration_security_key
          xml.websiteAuthorisationToken config.website_authorisation_token
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