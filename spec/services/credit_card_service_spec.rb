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

  describe "updating cards" do
    it "should update a card " do
      card = described_class.create(customer.id, :card => card_token)
      updated_card = described_class.update(customer.id, card.id, {name: "test name"})
      expect(updated_card.name).to eq("test name")
    end
  end

  describe "deleting cards" do
    it "should delete a card " do
      card = described_class.create(customer.id, :card => card_token)
      expect(described_class.delete(customer.id, card.id)[:deleted]).to eq(true)
    end
  end

  describe "charging a card" do
    it "should charge the card with the specified amount" do
      card = described_class.create(customer.id, :card => card_token)
      charge = described_class.charge(customer.id, card.id, 400, "usd")
      expect(charge.status).to eq("succeeded")
    end

    it "should send optional params when charging" do
      card = described_class.create(customer.id, :card => card_token)
      charge = described_class.charge(customer.id, card.id, 400, "usd", {description: "My first credit card charge"})
      expect(charge.description).to eq("My first credit card charge")
    end
  end

end