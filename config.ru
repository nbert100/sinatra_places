require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# to send patch and delete requests use 
use Rack::MethodOverride
#mount other controllers with 'use'

run ApplicationController
