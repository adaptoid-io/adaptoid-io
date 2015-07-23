ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
require 'shoulda-matchers'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending!
ActiveRecord::Migration.maintain_test_schema!

include FactoryGirl::Syntax::Methods

class ActiveSupport::TestCase; end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
