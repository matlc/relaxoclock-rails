class ApplicationController < ActionController::Base
  protect_from_forgery

  [
    {:name => "admin", :password => "supersecret"},
    {:name => "user", :password => "secret"},
  ].each do |credentials|
    http_basic_authenticate_with credentials
  end
end
