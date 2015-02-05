require 'spec_helper'

describe VendaApi do

  describe "Configuration" do

    it 'should have a default empty configuration' do
      expect(VendaApi.config).to eq({email: "", password: "", environment: ""})
    end

    it 'should return the passed in values' do
      VendaApi.configure(:environment => "sandbox", :email => "john.doe@venda.com", :password => "password123")
      expect(VendaApi.config).to eq({email: "john.doe@venda.com", password: "password123", environment: "sandbox"})
    end
  end

  describe "VendaService" do

    it "should return the correct namespaces" do
      expect(VendaApi::VendaService.namespaces).to eq(    {
        "xmlns:soap" => "http://schemas.xmlsoap.org/soap/envelope/",
        "xmlns:soapenc" => "http://schemas.xmlsoap.org/soap/encoding/",
        "xmlns:types" => "urn:VendaProducts/encodedTypes",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema"
      })
    end
  end

  describe "ProductService" do

  end

  describe "OrderService" do

  end
end
