module PowaApi
  class ProductService < PowaService

    def self.get_published_products(publish_token, opts = {})
    end

    def self.get_published_products_by_sku(sku_list)
    end

    def self.get_products(type = nil)

      client = Savon.client wsdl

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
             end
            end
          end
        end
      end
    end

    def self.get_products_by_sku(sku_list)
    end

    private

    def self.wsdl
      "https://api.sandbox.powa.com/ws/soap/v2/ProductService?wsdl"
    end

  end
end