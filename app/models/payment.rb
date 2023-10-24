class Payment < ApplicationRecord
  # protect_from_forgery

  require 'stripe'
  Stripe.api_key = 'sk_test_51NsJnhSJ1iUOrfrG6jQIEPYguTroGGRzfbwxyqq8f7uTs6SPXSi9JkPsOOgvRouavwmABY3Zt3lApEwkW5rxnBrP00p3ckI7Ql'
  attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv
  belongs_to :order
  before_validation :create_on_stripe
  # byebug
  
  def create_on_stripe
    # byebug
    # token = get_token
    byebug
    customer = Customer.find(5)
    params = { amount: 88888, currency: 'inr', source: nil,payment_method_types:['card'],payment_method:"pm_card_visa",confirm:true,customer:customer.stripe_id,description:"for testing purpose",shipping:{address:{city:"khargone",country:"IN",line1:"selda",postal_code:"451331",state:"MP"},name:"jonathan"}}
      # byebug
  #     source_params = {
  #   source: token
  #   }
    #   begin
    #     # byebug
    #   cardcreateresponse=Stripe::Customer.create_source(custom.stripe_id,source_params)
    # rescue Stripe::StripeError => e
    #   # byebug
    #   puts "Error: #{e.message}"
# end
# byebug
# cardcreateresponse
    
    response = Stripe::PaymentIntent.create(params)
    # byebug
    self.stripe_id = response.id
    # byebug
    self.client_secret = response.client_secret
  # #  byebug
  # #  cardcreateresponse
  #   # Stripe::confirmPaymentIntent(response.client_secret,{payment_method_types:'cards'})
  #   # response.next_action.use_stripe_sdk.stripe_js


  end

  # def get_token
  #   # byebug
  #   begin
  #     byebug
  #     token = Stripe::Token.create({card: {number:credit_card_number,exp_month: 5,exp_year: 2023,cvc: credit_card_cvv,},}).id
    
  #     # You can access the token ID like this:
  # # byebug
  #     token_id = token.id
  #     # Use the token for further Stripe API requests
  #   rescue Stripe::CardError => e
  #     # Handle the card error, e.g., display an error message to the user
  #     # byebug
  #     puts "Stripe error: #{e.message}"
  #   end
    
  # end


  # attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv
  # belongs_to :order
  # before_validation :create_on_stripe
  # def create_on_stripe
    
  #   token = get_token
  #   params = { amount: order.amount_cents, currency: 'usd', source: token}
  #   response = Stripe::PaymentIntent.create(params)
  #   self.stripe_id = response.id
  # end
  # def get_token
  #   token = Stripe::Token.create({
  #     card: {
  #       number: credit_card_number,
  #       exp_month: credit_card_exp_month,
  #       exp_year: credit_card_exp_year,
  #       cvc: credit_card_cvv,
  #     }
  #   })
  #   token_id = token.id
  # end
  # confirmPayment(response.client_secret,{payment_method_types:'cards'})
end
