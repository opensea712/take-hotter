# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.fail_fast = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)

    load "#{Rails.root}/db/seeds/allergy.seeds.rb"
    load "#{Rails.root}/db/seeds/language.seeds.rb"
    load "#{Rails.root}/db/seeds/service.seeds.rb"
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

# Post.create_elasticsearch_index # Post is our example model
# Tire.show BONSAI_INDEX_NAME do
#    import Post.all
#    refresh
#  end
