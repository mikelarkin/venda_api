venda-api
========

Ruby interface to the Venda API

[http://venda.com](http://venda.com)

Configuration
-------------

### Yaml example

```yaml
environment: "sandbox"
email: "john.doe@venda.com"
password: "password123"
```

### Configuration

```ruby
VendaApi.configure_with("path/to/yaml/file")
```

```ruby
VendaApi.configure(:environment => "sandbox", :email => "john.doe@venda.com",
 :password => "password123")
```

Usage
-------------

```ruby
products = VendaApi::ProductService.get_products
```