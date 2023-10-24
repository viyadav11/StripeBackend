puts 'CORS configuration loaded'
# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000' # Update with your React frontend's URL
      resource '/api/v1/*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
    end
end
  