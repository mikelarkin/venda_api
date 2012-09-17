require 'savon'
require 'powa_api/version'
require 'powa_api/config'
require 'powa_api/powa_service'
require 'powa_api/product_service'
require 'powa_api/order_service'

module PowaApi

  extend self

  def configure
    yield config
  end

  def config
    @config ||= Config.default
  end

end