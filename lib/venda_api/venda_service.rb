module VendaApi
  class VendaService

    protected

    def self.wsdl
      raise new Exception("Subclasses must implement self.wsdl")
    end

    def self.ssl_mode
      return :none
    end


    def self.base_url
      return ::VendaApi.config[:base_url]
    end

    def self.security_block(xml)
      xml.email(::VendaApi.config[:email], "xsi:type"=>"xsd:string") 
      xml.password(::VendaApi.config[:password], "xsi:type"=>"xsd:string")
    end

  end
end
