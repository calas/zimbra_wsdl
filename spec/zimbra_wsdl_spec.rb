require 'minitest_helper'

describe ZimbraWsdl do
  describe "#admin_wsdl" do
    let(:document) { ZimbraWsdl.admin_wsdl }

    it "returns a valid document path" do
      File.exists?(document).must_equal true
    end
  end
end
