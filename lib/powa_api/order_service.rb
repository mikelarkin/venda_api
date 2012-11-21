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

      begin
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
      rescue Savon::SOAP::Fault => e
        return nil if e.message.include?("Order not found")
        raise e.message
      end

      response.to_array(:get_order_details_response).first

    end

    # This method invokes find_updated_orders and then calls get_order_details for each order
    # and returns an array of the results
    def self.get_orders(start_date, end_date)
      orders = []

      # Grab the list of orders and extract the order numbers
      order_ids = OrderService.find_updated_orders(start_date, end_date).map { |order| order[:order_number] }

      order_ids.each do |order_id|
        orders << OrderService.get_order_details(order_id)
      end

      return orders.flatten.compact
    end

    private

    def self.wsdl
      base_url + "OrderService?wsdl"
    end

  end
end