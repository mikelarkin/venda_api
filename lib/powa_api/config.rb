module PowaApi
  Config = Struct.new(:environment, :integration_security_key, :website_authorisation_token) do

    def self.default
      config = new
      config.integration_security_key = "KEY-6b05827d-e9c4-4d86-9c45-92394dfadf62"
      config.website_authorisation_token = "TOKEN-03980096-5437-465a-8ce0-f6cd510c1f7a"
      config.environment = "sandbox"
      config
    end

  end
end