# config/initializers/rack_attack.rb
class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Limit requests per minute for all requests to a specific endpoint
  throttle('requests_per_minute', limit: 30, period: 1.minute) do |request|
   request.ip
  end
end
