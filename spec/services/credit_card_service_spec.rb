require 'stripe_mock'

describe CreditCardService do
  before { StripeMock.start }
  after { StripeMock.stop }
  let(:customer){CustomerService.create(:email => "test@test.com", :name => "MyName")}
  let(:card_token){StripeMock.generate_card_token(last4: "9191", exp_year: 1984)}

  describe "creating cards" do
    it "should create a card and add it to a customer" do
      card = described_class.create(customer.id, :card => card_token)
      expect(card.id).not_to be_nil
      expect(card.customer).to eq(customer.id)
    end
  end

end