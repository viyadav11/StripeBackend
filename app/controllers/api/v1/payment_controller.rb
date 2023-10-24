class Api::V1::PaymentController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_cors_headers
    before_action :order_params
    def create
  byebug
        @payment = Payment.new(order_params)
        if @payment.save
            byebug
            render json: { client_secret_key: @payment.client_secret }, status: :created
        # else
          # render json: @response.errors, status: :unprocessable_entity
        end
      end
      def new
        @payment =Payment.new()
      end
      private

      def set_cors_headers
        response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
        response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      end

      def order_params
byebug
        params.require(:data).permit(:name, :email, :totalPrice, :address,:order_id)
      end

end
