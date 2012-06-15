class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :authenticate_user!
  load "lib/constants.rb"
  include GlobalConstants
end
