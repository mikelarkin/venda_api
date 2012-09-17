module PowaApi
  class PowaService

    def self.config
      Config.default
    end

    protected

    def self.namespaces
      {
        "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:urn" => "urn:powa:api:PowaAPI"
      }
    end
  end
end