module PowaApi
  class ProductService < PowaService

    def self.find_updated_orders(from, to = nil)

      client = Savon.client wsdl

      response = client.request :get_updated_orders do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetUpdatedOrdersRequest) do |xml|
             end
            end
          end
        end
      end

    end

    private

    def self.wsdl
      base_url + "OrderService?wsdl"
    end

  end
end