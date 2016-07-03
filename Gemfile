source "https://rubygems.org"

ruby "2.3.1"

gem "rails", "4.2.6"
gem "pg", "0.18.1"

gem "responders"

gem "slim-rails", "~> 3.0"

gem "redcarpet"

gem "sass-rails", "~> 5.0"
gem "bootstrap-sass", "~> 3.3"

group :development do
  gem "spring"
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "rubocop", require: false
  gem "dotenv-rails"
end

group :production do
  gem "rails_12factor"
end
