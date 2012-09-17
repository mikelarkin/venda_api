module PowaApi
  class PowaService

    protected

    def self.namespaces
      {
        "xmlns:soapenv" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:urn" => "urn:powa:api:PowaAPI"
      }
    end
  end
end