module VendaApi
  class OrderService < VendaService

    def self.find_orders_by_date(start_date, end_date = nil)

      client = Savon.client(wsdl: wsdl, ssl_verify_mode: ssl_mode)
      response = client.call :venda_search_order, message: search_order_by_date_xml(start_date, end_date)

      # return an array of order elements
      response.body[:venda_search_order_response][:response_elements][:response_element].flatten.compact

    end

    def self.get_order_details(order_number)

      client = Savon.client(wsdl: wsdl, ssl_verify_mode: ssl_mode)
      response = client.call :venda_retrieve_order, message: retrieve_order_xml(order_number)

      # return order details
      response.body[:venda_retrieve_order_response][:response_elements][:response_element]

    end

    # This method invokes find_updated_orders and then calls get_order_details for each order
    # and returns an array of the results
    def self.get_orders(start_date, end_date=nil)
      orders = []

      # Grab the list of orders and extract the order numbers
      order_numbers = OrderService.find_orders_by_date(start_date, end_date).map { |order| order[:order_number] }

      order_numbers.each do |order_number|
        orders << OrderService.get_order_details(order_number)
      end

      return orders.flatten.compact
    end

    def self.search_order_by_date_xml(updated_from, updated_to=nil)

      namespaces = {
        "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:soapenc" => "http://schemas.xmlsoap.org/soap/encoding/",
        "xmlns:tns" => "urn:VendaProducts",
        "xmlns:types" => "urn:VendaProducts/encodedTypes",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema"
      }

      builder = Builder::XmlMarkup.new
      # builder.instruct!(:xml, :version => "1.0")

      builder.soap(:Envelope, namespaces) do |xml|

        xml.soap(:Body, "soap:encodingStyle"=>"http://schemas.xmlsoap.org/soap/encoding/") do |xml|

          xml.tns(:VendaSearchOrder, "xmlns:tns"=>"urn:VendaOrders") do |xml|
            security_block(xml)
            xml.orderElements({"href" => "#id1"})
          end

          xml.soapenc(:Array, {"id" => "id1", "soapenc:arrayType" => "tns:searchOrderElement[1]"}) do |xml|
            xml.Item("href" => "#date")
          end

          xml.tns(:searchOrderElement, {"id" => "date", "xsi:type" => "tns:searchOrderElement"}) do |xml|
            xml.beginDate updated_from.strftime('%FT%T'), "xsi:type" => "xsd:dateTime"
            xml.endDate updated_to.strftime('%FT%T'), "xsi:type" => "xsd:dateTime" if updated_to
          end

        end
      end
    end

    def self.retrieve_order_xml(order_number)

      namespaces = {
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:soapenc" => "http://schemas.xmlsoap.org/soap/encoding/",
        "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema",
        "soap:encodingStyle" => "http://schemas.xmlsoap.org/soap/encoding/"
      }

      builder = Builder::XmlMarkup.new

      builder.soap(:Envelope, namespaces) do |xml|

        xml.soap(:Body) do |xml|

          xml.response(:VendaRetrieveOrder, "xmlns:response"=>"urn:VendaOrders") do |xml|
            security_block(xml)
            xml.orderElements( {"xsi:type" => "soapenc:Array", "soapenc:arrayType" => "response:orderElement[]"}) do |xml|
              xml.orderElement do |xml|
                xml.orderNumber order_number
              end
            end
          end
        end
      end
    end

    def self.wsdl
      base_url + "VendaOrders.wsdl"
    end

  end
end
