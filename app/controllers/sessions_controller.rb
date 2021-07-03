class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログイン完了"
    else
      flash.now[:alert] = "メールもしくはパスワードが違います"
      render :new
    end
  end
end
