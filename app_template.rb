require 'bundler'

@app_name = app_name

run "rm README.rdoc"
run "echo \"# #{@app_name}\" > README.md"

#=================================================
# Gemfile
#=================================================

#-- Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootswatch-rails', '>= 3.2'

#-- bundle install
Bundler.with_clean_env do
  run 'bundle install --path vendor/bundle -j4'
end

#=================================================
# app/assets/javascript/application.js
#=================================================

create_file 'app/assets/javascripts/application.js', <<-JS, force: true
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
JS

#=================================================
# app/assets/stylesheets/application.sass
#=================================================

create_file 'app/assets/stylesheets/application.sass', <<-CSS
/*
 *= require_tree .
 *= require_self
 */

@import "bootstrap-sprockets"
@import "bootswatch/cerulean/variables"
@import "bootstrap"
@import "bootswatch/cerulean/bootswatch"
@import "overrides"
CSS

create_file 'app/assets/stylesheets/overrides.sass'
run 'rm app/assets/stylesheets/application.css'

