source "https://rubygems.org"
ruby "3.1.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

gem "rails", "~> 7.1.5", ">= 7.1.5.1"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Ransack filtering
gem 'ransack'

# Kaminari pagination
gem 'kaminari'

# Fake data with faker
gem 'faker'

# Swagger para API
gem 'rswag-api'
gem 'rswag-ui'
gem 'rswag'

# For .env use
gem "dotenv"

# For cors
gem 'rack-cors'

# Rspect-rails to work with swager
gem 'rspec-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

gem "dockerfile-rails", ">= 1.7", :group => :development

gem "litestream", "~> 0.12.0"

gem "aws-sdk-s3", "~> 1.178", :require => false
