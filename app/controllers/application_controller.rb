class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  enable_authorization
end
