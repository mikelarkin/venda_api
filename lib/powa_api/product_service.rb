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

            header_block(xml)

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

    def self.header_block(xml)
      xml.soapenv(:Header) do |xml|
        xml.urn(:Credentials) do |xml|
          xml.integrationSecurityKey config.integration_security_key
          xml.websiteAuthorisationToken config.website_authorisation_token
        end
      end
    end

  end
end