require 'savon'
require 'zimbra_wsdl'

require File.expand_path('../zimbra_authentication.rb', __FILE__)

Savon.configure do |config|
  config.log = false
  config.log_level = :info
  # config.logger = Logger.new('/tmp/zimbra_wsdl_savon_example.log')
end

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

accounts.each do |account|
  puts account[:@name]
end
