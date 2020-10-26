class ApplicationController < ActionController::Base
  include Authenticatable

  helper TailwindHelper
  helper_method :current_user, :current_customer, :current_financial_planner
end
