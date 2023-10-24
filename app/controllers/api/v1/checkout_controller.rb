class Api::V1::CheckoutController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        byebug 
        a="https://example.com/success",

            mode:'payment',
            Stripe::Checkout::Session.create
                ({
               
                # Remove the payment_method_types parameter
                # to manage payment methods in the Dashboard
                payment_method_types: ['card'],
                line_items: [{
                    price_data: {
                    # The currency parameter determines which
                    # payment methods are used in the Checkout Session.
                        currency: 'eur',
                        product_data: {
                            name: 'T-shirt',
                        },
                        unit_amount: 2000,
                        },
                        quantity: 1,
                    }],
                success_url: a,
                cancel_url: root_url,
                })
    end
end
