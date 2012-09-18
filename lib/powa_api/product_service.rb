module PowaApi
  class ProductService < PowaService

    def self.get_published_products(publish_token, batch_number = nil)
      client = Savon.client wsdl

      response = client.request :get_published_products do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetPublishedProductsRequest) do |xml|
                xml.publishToken publish_token
                xml.batchNumber batch_number if batch_number
             end
            end
          end
        end
      end
    end

    def self.get_published_products_by_sku(*skus)
      client = Savon.client wsdl

      response = client.request :get_published_products_by_sku do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetPublishedProductsBySkuRequest) do |xml|
                xml.skuList skus.join(' ')
             end
            end
          end
        end
      end
    end

    def self.get_products(batch_number = nil)

      client = Savon.client wsdl

      response = client.request :get_products do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetProductsRequest) do |xml|
                xml.batchNumber batch_number if batch_number
             end
            end
          end
        end
      end
    end

    def self.get_products_by_sku(*skus)
      client = Savon.client wsdl

      response = client.request :get_products_by_sku do
        soap.xml do |xml|
          xml.soapenv(:Envelope, namespaces) do |xml|

            header_block(xml)

            xml.soapenv(:Body) do |xml|
              xml.urn(:GetProductsBySkuRequest) do |xml|
                xml.skuList skus.join(' ')
             end
            end
          end
        end
      end
    end

    private

    def self.wsdl
      base_url + "ProductService?wsdl"
    end

  end
end