class ApiController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, only: [:create, :destroy]

  def missing_resource_json
    render json: {message: 'Resource not found', data: []}, status: 404
  end

  def resource_not_saved_json(errors)
    render json: {message: 'Resource not saved', data: errors}, status: 422
  end

  def loaded_all_resources_json(resource_name, data)
    render json: {message: "Loaded all #{resource_name}", data: data}, status: 200
  end

  def loaded_one_resource_json(resource_name, data)
    render json: {message: "Loaded a #{resource_name}", data: data}, status: 200
  end

  def created_a_resource_json(resource_name, data)
    render json: {message: "Created a #{resource_name}", data: data}, status: 201
  end

  def deleted_a_resource_json(resource_name)
    render json: {status: 'Success', message: "#{resource_name} deleted"}, status: 204
  end

  private
    def authenticate_user
      user_token = request.headers['X-USER-TOKEN']
      if user_token
        @user = User.find_by_token(user_token)
        #Unauthorize if a user object is not returned
        if @user.nil?
          return unauthorize
        end
      else
        return unauthorize
      end
    end

    def unauthorize
      head status: :unauthorized
      return false
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(token: token)
      end
    end

end