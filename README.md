venda-api
========

Ruby interface to the Venda API

[http://venda.com](http://venda.com)

Configuration
-------------

### Yaml example

```yaml
environment: "sandbox"
integration_security_key: "KEY-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
website_authorisation_token: "TOKEN-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
```

Then

```ruby
VendaApi.configure_with("path/to/yaml/file")
```

### Ruby example

```ruby
VendaApi.configure(:environment => "sandbox", :integration_security_key => "KEY-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
 :website_authorisation_token => "TOKEN-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX")
```

Usage
-------------

```ruby
products = VendaApi::ProductService.get_products
```