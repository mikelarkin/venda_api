module PowaApi
  class OrderService < PowaService

    def self.find_updated_orders(from, to = nil)

      client = Savon.client wsdl

      response = client.request :get_updated_orders do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:FindUpdatedOrdersRequest) do |xml|
                xml.updatedFrom "2008-10-31T15:07:38.6875000-05:00"
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