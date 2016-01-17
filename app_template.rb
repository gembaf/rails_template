require 'bundler'

@app_name = app_name

run "rm README.rdoc"
run "echo \"# #{@app_name}\" > README.md"

#=================================================
# Gemfile
#=================================================

Bundler.with_clean_env do
  run 'bundle install --path vendor/bundle -j4'
end

