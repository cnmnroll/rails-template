require 'bundler'

# git setting
git :init
git add: '.'
git commit: %Q{-m 'Initial commit'}

# Bootstrap
gem 'bootstrap-sass'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
gem 'will_paginate-bootstrap'

# turbolinks support
gem 'jquery-turbolinks'

# App Server
gem 'unicorn'
# Slim
gem 'slim-rails'

# Presenter Layer Helper
gem 'active_decorator'
gem 'nokogiri'


gem "nested_form"
gem "font-awesome-rails"
gem 'draper'

run_bundle
# set config/application.rb
application  do
  %q{
    # Set timezone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # 日本語化
    I18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    # generatorの設定
    config.generators do |g|
      g.template_engine :slim
    end
    # libファイルの自動読み込み
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  }
end
run "rm app/assets/stylesheets/application.css"
run "rm app/assets/javascripts/application.js"

@repo_url = 'https://raw.githubusercontent.com/cnmnroll/rails-template/master'
run "wget #{@repo_url}/app/assets/stylesheets/application.scsss -P app/assets/stylesheets/"
run "wget #{@repo_url}/app/assets/javascripts/application.js -P app/assets/javascripts/"

run "rm db/seeds.rb"
run "wget -r -l 0 #{@repo_url}/db/seeds -P db/"
run "wget #{@repo_url}/db/seeds.rb -P db/"

run "wget #{@repo_url}/config/lacales/ja.yml -P app/config/lacales/"
