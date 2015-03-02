require 'rails_helper'
require 'stripe_mock'
RSpec.describe Customer, :type => :model do

  before { StripeMock.start }
  after { StripeMock.stop }

  it "should create a stripe customer on creation" do
    customer = Customer.create(email: "test@test.com", name: "MyNameIs")
    expect(customer.stripe_id).not_to be_nil
  end
end
