require './config/environment'
require_relative './app/controllers/user_controller'
require_relative './app/controllers/category_controller'
require_relative './app/controllers/item_controller'
require_relative './app/controllers/pantry_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UserController 
use CategoryController 
use ItemController 
use PantryController 
run ApplicationController
