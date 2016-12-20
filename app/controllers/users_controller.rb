class UsersController < ApiController

  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 'Success', message: 'successfully created account', data: user}, status: :ok
    else
      render json: {message: 'Error creating user', data: user.errors.full_messages}
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: {status: 'Success', data: user}
    else
      render_error_json
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: {status: 'Success', message: 'User deleted'}, status: :ok
    else
      render_error_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end

  
end