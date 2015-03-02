require 'stripe'
Stripe.api_key = "sk_test_rHL45YeWpAALUIACwrsfV1ji"

class CustomerService
  def initialize(params)
    @email = params[:email]
    @description = params[:name]
  end

  def create
    begin
      Stripe::Customer.create(:email => email, :description => description)
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError => e
      Rails.logger("Error creating customer: " + e.message)
      false
    end
  end

  def retrieve(customer_id)
    begin
      Stripe::Customer.retrieve(customer_id)
    rescue Stripe::InvalidRequestError, Stripe::AuthenticationError, Stripe::APIConnectionError, Stripe::StripeError => e
      Rails.logger("Error retrieving customer with ID #{customer_id}: " + e.message)
      nil
    end
  end
  attr_reader :email, :description
end