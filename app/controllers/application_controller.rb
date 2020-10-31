class ApplicationController < ActionController::Base
  include Authenticatable

  before_action :gon_root_name

  helper TailwindHelper
  helper_method :current_user, :current_customer, :current_financial_planner

  def gon_root_name
    gon.root_name = ENV['ROOT_NAME'].to_s
  end
end
