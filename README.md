venda-api
========

Ruby interface to the Venda API

[http://venda.com](http://venda.com)

Configuration
-------------

### Yaml example

```yaml
email: "john.doe@venda.com"
password: "password123"
url: http://vendashop.venda.com/path/to/wsdl
```

### Configuration

```ruby
VendaApi.configure_with("path/to/yaml/file")
```

```ruby
VendaApi.configure(:url => "http://vendashop.venda.com/path/to/wsdl", :email => "john.doe@venda.com",
 :password => "password123")
```

Usage
-------------

```ruby
products = VendaApi::OrderService.get_orders(Date.today - 3.days, Date.today)
```