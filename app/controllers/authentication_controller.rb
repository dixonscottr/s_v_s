class AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { errors: command.errors }, status: 401
    end
  end
end