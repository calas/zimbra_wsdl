require "zimbra_wsdl/version"

module ZimbraWsdl
  # Returns the path to the zimbra admin wsdl document.
  #
  # Example:
  #
  #   client = Savon::Client.new do
  #     wsdl.document = ZimbraWsdl.admin_wsdl
  #   end
  #
  def self.admin_wsdl
    File.expand_path('../zimbra.wsdl', __FILE__)
  end
end
