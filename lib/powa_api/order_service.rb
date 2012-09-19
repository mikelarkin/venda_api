module PowaApi
  class OrderService < PowaService

    def self.find_updated_orders(updated_from, updated_to = nil)

      client = Savon.client wsdl

      response = client.request :get_updated_orders do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:FindUpdatedOrdersRequest) do |xml|
                xml.updatedFrom updated_from.strftime('%FT%T.000')
                xml.updateTo updated_to.strftime('%FT%T.000') if updated_to
             end
            end
          end
        end
      end

      [response.to_array(:find_updated_orders_response).first[:orders]].flatten.compact

    end

    def self.get_order_details(order_number)

      client = Savon.client wsdl

      response = client.request :get_order_details do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetOrderDetailsRequest) do |xml|
                xml.orderNumber order_number
             end
            end
          end
        end
      end

      response.to_array(:get_order_details_response).first

    end

    private

    def self.wsdl
      base_url + "OrderService?wsdl"
    end

  end
end