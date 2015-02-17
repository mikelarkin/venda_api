require 'savon'
require 'yaml'
require 'venda_api/version'
require 'venda_api/venda_service'
require 'venda_api/product_service'
require 'venda_api/order_service'

module VendaApi

  extend self

  @config = {
    :email => "",
    :password => "",
    :base_url => ""
  }

  @valid_config_keys = @config.keys


  # Clear out existing configuration
  def self.reset
    configure({:email => "", :password => "", :base_url => ""})
  end

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
