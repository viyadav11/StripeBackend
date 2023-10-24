class Api::V1::OrdersController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_cors_headers
    def create
  # byebug
        @order = Order.new(order_params.merge(amount_cents: 2000, payment_method: 'credit_card'))
        if @order.save
          # byebug
          render json: { clientSecret: @order.payment.client_secret }, status: :created
          # render json: {data:"hello"}
        end
      end
      def new
        @order =Order.new()
      end
      private

      def set_cors_headers
        response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
        response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      end

      def order_params
        # byebug
        params.require(:data).permit(:customer_id, :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv)
      end

      def buy_now
      
      end
end
