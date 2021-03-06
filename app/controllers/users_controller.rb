class UsersController < ApiController

  skip_before_action :authenticate_request, only: [:create]

  def create
    user = User.new(user_params)
    if user.save
      created_a_resource_json("user", user)
    else
      resource_not_saved_json(user.errors.full_messages)
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      loaded_one_resource_json("user", user)
    else
      missing_resource_json
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      deleted_a_resource_json("user")
    else
      missing_resource_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
  
end