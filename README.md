# ZimbraWsdl

ZimbraWsdl just provides a valid WSDL document for the VMware Zimbra Soap API
that can be used with any soap library.

The gem just provides a valid document and a method that returns the path to
it, so you can just require this gem in your Gemfile and you get a (hopefully)
updated and community backed version of the Zimbra API WSDL.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zimbra_wsdl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zimbra_wsdl

## Usage

Example usage with savon:

```ruby
require 'savon'
require 'zimbra_wsdl'
require 'pp'

ZIMBRA_SERVER = "zimbra.example.com"
ZIMBRA_ADMIN_USERNAME = "admin@zimbra.example.com"
ZIMBRA_ADMIN_PASSWORD = "YOUR_PASSWORD"

client = Savon::Client.new do
  wsdl.document = ZimbraWsdl.admin_wsdl
  wsdl.endpoint = "https://#{ZIMBRA_SERVER}:7071/service/admin/soap"
  http.auth.ssl.verify_mode = :none
end

# Authenticate your client (NOTICE: ruby 1.9 hash syntax)
client.request :auth_request, body: { name: ZIMBRA_ADMIN_USERNAME, password: ZIMBRA_ADMIN_PASSWORD }

# Once authenticated you can call any api method
accounts_response = client.request :get_all_accounts_request
accounts = accounts_response.to_array(:get_all_accounts_response, :account)

pp accounts
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
