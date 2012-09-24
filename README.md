powa-api
========

Ruby interface to the POWA API

[http://developer.powa.com/guide](http://developer.powa.com/guide)

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
PowaApi.configure_with("path/to/yaml/file")
```

### Ruby example

```ruby
PowaApi.configure(:environment => "sandbox", :integration_security_key => "KEY-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
 :website_authorisation_token => "TOKEN-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX")
```

Usage
-------------

```ruby
PowaApi::ProductService.get_products
```