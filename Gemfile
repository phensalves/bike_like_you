source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails',                        '~> 5.1.5'
gem 'pg', '>= 0.18',                '< 2.0'
gem 'puma',                         '~> 3.7'
gem 'devise'
gem 'simple_token_authentication',  '~> 1.0'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'rack-cors'
gem 'rack-attack'
gem 'active_model_serializers',     '~> 0.10.0'
gem 'will_paginate',                '~> 3.1.0'
gem 'aasm'
gem 'figaro'
gem 'sidekiq'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rubocop',                    '~> 0.54.0', require: false
  gem 'factory_bot_rails',          '~> 4.0', require: false
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'shoulda-matchers',           '~> 3.1'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen',                     '>= 3.0.5', '< 3.2'
  gem 'annotate'
end