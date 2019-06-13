require './config/environment'
require_relative './app/controllers/user_controller'
require_relative './app/controllers/session_controller'
require_relative './app/controllers/pantry_controller'
require_relative './app/controllers/category_controller'
require_relative './app/controllers/item_controller'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use UserController 
use SessionController
use PantryController 
use CategoryController 
use ItemController 
run ApplicationController
