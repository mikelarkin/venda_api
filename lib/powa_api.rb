require 'savon'
require 'yaml'
require 'powa_api/version'
require 'powa_api/powa_service'
require 'powa_api/product_service'
require 'powa_api/order_service'

module PowaApi

  extend self

  @config = {
              :integration_security_key => "KEY-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
              :website_authorisation_token => "TOKEN-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
              :environment => "sandbox"
            }

  @valid_config_keys = @config.keys

  def self.configure(opts = {})
    opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
  end

  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
    rescue Psych::SyntaxError
      log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
    end

    configure(config)
  end

  def self.config
    @config
  end

end