class SessionsController < ApplicationController
  def create
    member = Member.find_by(login_id: params[:login_id])
    if member&.authenticate(params[:password])
      session[:member_id] = member.id
    else
      flash.alert = "ログインIDとパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
