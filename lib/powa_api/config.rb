module PowaApi
  Config = Struct.new(:integration_security_key, :website_authorisation_token) do

    def self.default
      config = new
      config
    end

  end
end