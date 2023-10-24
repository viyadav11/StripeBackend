Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      get :neworder, to:'orders#new'
      post :orders, to: 'orders#create'
      get :buy, to: 'orders#buy_now'
      post :payment, to: 'payment#create'
    end
  end
  # get 'buy', to:"order#buy_now"
end