require 'spec_helper'

# require the helper module
require "savon/mock/spec_helper"

describe VendaApi do

  before do
    VendaApi.reset
  end

  describe "Configuration" do

    it 'should have a default empty configuration' do
      expect(VendaApi.config).to eq({email: "", password: "", base_url: ""})
    end

    it 'should return the passed in values' do
      VendaApi.configure(:base_url => "http://fake.com/api", :email => "john.doe@venda.com", :password => "password123")
      expect(VendaApi.config).to eq({email: "john.doe@venda.com", password: "password123", base_url: "http://fake.com/api"})
    end
  end

end
