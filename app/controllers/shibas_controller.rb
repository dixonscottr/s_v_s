class ShibasController < ApiController

  def index
    shibas = Shiba.all
    render json: {status: 'Success', message: 'loaded all shibas', data: shibas}, status: :ok
  end

  def create
    shiba = Shiba.new(shiba_params)
    if shiba.save
      render json: {status: 'Success', message: 'Created a shiba', data: shiba}, status: :ok
    else
      render json: {message: 'Error creating shiba', data: shiba.errors.full_messages}
    end
  end

  def show
    shiba = Shiba.find_by(id: params[:id])
    if shiba
      render json: {status: 'Success', message: 'loaded a shiba', data: shiba}, status: :ok
    else
      render_error_json
    end
  end

  def destroy
    shiba = Shiba.find_by(id: params[:id])
    if shiba
      shiba.destroy
      render json: {status: 'Success', message: 'Shiba deleted'}, status: :ok
    else
      render_error_json
    end
  end

  private

  def shiba_params
    params.require(:shiba).permit(:name, :url, :video)
  end

end