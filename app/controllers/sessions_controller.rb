class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && (@user.password == params[:user][:password])
      session = @user.sessions.create

      cookies.permanent.signed[:twitter_session_token] = {
        value: session.token,
        httponly: true,
      }

      render json: {
        success: true,
      }
    else
      render json: {
        success: false,
      }
    end
  end
end
