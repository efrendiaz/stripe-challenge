require 'stripe'
Stripe.api_key = "sk_test_rHL45YeWpAALUIACwrsfV1ji"

class CreditCardService
  def self.create(customer_id, params)
    begin
      customer = CustomerService.retrieve(customer_id)
      customer.sources.create(:card => params[:card])
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError, Stripe::CardError => e
      Rails.logger("Error creating customer: " + e.message)
      false
    end
  end

end