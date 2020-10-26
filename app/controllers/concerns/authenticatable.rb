module Authenticatable
  extend ActiveSupport::Concern

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_customer
    return unless session[:user_id]

    user = User.find_by(id: session[:user_id])
    @current_customer ||= user if user&.customer?
  end

  def current_financial_planner
    return unless session[:user_id]

    user = User.find_by(id: session[:user_id])
    @current_financial_planner ||= user if user&.financial_planner?
  end

  def authenticated!
    redirect_to sign_in_path, flash: { notice: 'ログインが必要です' } unless current_user
  end

  def authenticated_financial_planner!
    redirect_to root_path, flash: { notice: '権限がありません' } unless current_financial_planner
  end
end
