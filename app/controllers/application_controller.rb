class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception

  before_action :authenticate_request

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end
