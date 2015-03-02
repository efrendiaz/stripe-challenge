require 'stripe'
Stripe.api_key = "sk_test_rHL45YeWpAALUIACwrsfV1ji"

class CreditCardService
  def self.create(customer_id, params)
    begin
      customer = CustomerService.retrieve(customer_id)
      customer.sources.create(:card => params[:card])
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError, Stripe::CardError => e
      Rails.logger("Error creating a card: " + e.message)
      false
    end
  end

  def self.update(customer_id, card_id, params)
    allowed_attributes = %i(address_city  address_country address_line1 address_line2 address_state address_zip exp_month exp_year metadata name)
    begin
      customer = CustomerService.retrieve(customer_id)
      card = customer.sources.retrieve(card_id)
      allowed_attributes.each{|a| card.send("#{a}=", params[a]) unless params[a].nil?}
      card.save
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError, Stripe::CardError => e
      Rails.logger("Error updating a card: " + e.message)
      false
    end
  end

  def self.delete(customer_id, card_id)
    begin
      customer = CustomerService.retrieve(customer_id)
      customer.sources.retrieve(card_id).delete
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError, Stripe::CardError => e
      Rails.logger("Error updating a card: " + e.message)
      false
    end
  end

  def self.charge(customer_id, card_id, amount, currency, optional_params = {})
    allowed_attributes = %i( description metadata capture statement_descriptor receipt_email application_fee shipping)
    required_params = {amount: amount, currency: currency, source: card_id , customer: customer_id}
    required_params.merge!(optional_params.delete_if{|k,v| !allowed_attributes.include?(k)})
    begin
      charge = Stripe::Charge.create(required_params)
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError, Stripe::CardError => e
      Rails.logger("Error charging card: " + e.message)
      false
    end
  end

end