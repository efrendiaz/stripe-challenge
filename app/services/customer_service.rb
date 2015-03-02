require 'stripe'
Stripe.api_key = "sk_test_rHL45YeWpAALUIACwrsfV1ji"

class CustomerService

  def self.create(params)
    begin
      Stripe::Customer.create(:email => params[:email], :description => params[:name])
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError => e
      Rails.logger("Error creating customer: " + e.message)
      false
    end
  end

  def self.retrieve(customer_id)
    begin
      Stripe::Customer.retrieve(customer_id)
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError => e
      Rails.logger("Error retrieving customer with ID #{customer_id}: " + e.message)
      nil
    end
  end

end