class ApplicationController < ActionController::Base
  helper TailwindHelper
  helper_method :current_user, :current_customer, :current_financial_planner

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_customer
    @current_customer ||= current_user if current_user.customer?
  end

  def current_financial_planner
    @current_financial_planner ||= current_user if current_user.financial_planner?
  end

  def authenticated!
    redirect_to sign_in_path, flash: { notice: 'ログインが必要です' } unless current_user
  end
end
