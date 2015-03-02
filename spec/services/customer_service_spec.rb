require 'stripe_mock'

describe CustomerService do
  before { StripeMock.start }
  after { StripeMock.stop }
  let(:service){ described_class.new(:email => "test@test.com", :name => "MyName")}

  describe "creating Customers" do
    it "should create a customer" do
      customer = described_class.create(:email => "test@test.com", :name => "MyName")
      expect(customer.email).to eq('test@test.com')
    end
  end

  describe "retreiving Customers" do
    it "should get the customer" do
      customer = described_class.create(:email => "test@test.com", :name => "MyName")
      retrieved_customer = described_class.retrieve(customer.id)
      expect(retrieved_customer.email).to eq('test@test.com')
    end
  end
end