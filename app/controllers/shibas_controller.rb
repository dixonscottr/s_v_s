class ShibaController.rb < ApiController
  def index
    shibas = Shiba.all
    render json: {status: 'Success', message: 'loaded all shibas', data: shibas}, status: :ok
  end
end