class AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    username = params[:user][:username]
    password = params[:user][:password]
    command = AuthenticateUser.call(username, password)
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { errors: command.errors }, status: 401
    end
  end
end