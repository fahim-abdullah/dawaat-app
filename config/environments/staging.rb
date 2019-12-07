# Just use the production settings
require File.expand_path('../production.rb', __FILE__)
 
Rails.application.configure do
  # Here override any defaults
  config.middleware.insert_after(::Rack::Lock, "::Rack::Auth::Basic", "Staging") do |u, p|
    [u, p] == ['demo', 'mango']
  end
end

