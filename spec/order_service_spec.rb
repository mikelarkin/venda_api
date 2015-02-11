require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

describe VendaApi do
  describe "OrderService" do

    # include the helper module
    include Savon::SpecHelper

    # set Savon in and out of mock mode
    before(:all) {
      savon.mock!
      VendaApi.configure(:email => "test@venda.com", :password => "password123", :base_url => "http://example.com", :environment => :test)
    }
    after(:all)  { savon.unmock! }
    let(:wsdl) { File.read("spec/fixtures/order_service/VendaOrders.wsdl")}
    let(:client) {Savon.client(wsdl: wsdl, ssl_verify_mode: :none)}



    describe ".search_order_by_date_xml" do

      let(:request_fixture) { File.read("spec/fixtures/order_service/search_orders_request.xml") }
      let(:response_fixture) { File.read("spec/fixtures/order_service/search_orders_response.xml") }

      it "should return the properly formatted soap message" do
        # Make sure the XML matches
        expect(VendaApi::OrderService.search_order_by_date_xml(Date.parse("2010-05-18"), Date.parse("2010-05-18")).downcase.gsub(/\s/,'')).to eq(request_fixture.gsub(/\s/,'').downcase)
      end

    end

    describe ".retrieve_order_xml" do

      let(:request_fixture) { File.read("spec/fixtures/order_service/retrieve_order_request.xml") }
      let(:response_fixture) { File.read("spec/fixtures/order_service/retrieve_order_response.xml") }

      it "should return the properly formatted soap message" do

        # Make sure the XML matches
        expect(VendaApi::OrderService.retrieve_order_xml("596382").downcase.gsub(/\s/,'')).to eq(request_fixture.gsub(/\s/,'').downcase)
      end

    end


  end
end
