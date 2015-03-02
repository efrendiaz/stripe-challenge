class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  before_create :create_stripe_customer

  private

  def create_stripe_customer
    stripe_customer = CustomerService.new(:email => self.email, :name => self.name).create
    if stripe_customer
      self.stripe_id = stripe_customer.id
    else
      self.errors.add(:stripe_id, "unable to create stripe customer")
    end
  end
end