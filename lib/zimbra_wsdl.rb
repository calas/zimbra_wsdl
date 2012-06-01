require "zimbra_wsdl/version"

module ZimbraWsdl
  # Returns the path to the zimbra admin wsdl document.
  #
  # Example:
  #
  #   require 'savon'
  #   require 'zimbra_wsdl'
  #
  #   client = Savon::Client.new do
  #     wsdl.document = ZimbraWsdl.admin_wsdl
  #     wsdl.endpoint = 'https://zimbra.example.com:7071/service/admin/soap'
  #   end
  #
  def self.admin_wsdl
    File.expand_path('../zimbra.wsdl', __FILE__)
  end
end
