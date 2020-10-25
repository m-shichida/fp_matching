class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, flash: { notice: 'ログインしました' }
    else
      redirect_to sign_in_path, flash: { notice: 'ユーザーが存在しないか、メールアドレスが正しくありません' }
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to sign_in_path, flash: { notice: 'ログアウトしました' }
    else
      redirect_to sign_in_path, flash: { notice: 'すでにログアウトしています' }
    end
  end

  private

  def permit_params
    params.require(:user).permit(:email)
  end
end
