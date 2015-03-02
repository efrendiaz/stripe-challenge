require 'stripe_mock'

describe CustomerService do
  before { StripeMock.start }
  after { StripeMock.stop }
  let(:service){ described_class.new(:email => "test@test.com", :name => "MyName")}

  describe "creating Customers" do
    it "should create a customer" do
      customer = service.create
      expect(customer.email).to eq('test@test.com')
    end
  end

  describe "retreiving Customers" do
    it "should get the customer" do
      customer = service.create
      retrieved_customer = service.retrieve(customer.id)
      expect(retrieved_customer.email).to eq('test@test.com')
    end
  end
end