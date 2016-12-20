class ShibasController < ApiController

  def index
    shibas = Shiba.all
    loaded_all_resources_json("shibas", shibas)
  end

  def create
    shiba = Shiba.new(shiba_params)
    if shiba.save
      created_a_resource_json("shiba", shiba)
    else
      resource_not_saved_json(shiba.errors.full_messages)
    end
  end

  def show
    shiba = Shiba.find_by(id: params[:id])
    if shiba
      loaded_one_resource_json("shiba", shiba)
    else
      missing_resource_json
    end
  end

  def destroy
    shiba = Shiba.find_by(id: params[:id])
    if shiba
      shiba.destroy
      deleted_a_resource_json("shiba")
    else
      missing_resource_json
    end
  end

  private

  def shiba_params
    params.require(:shiba).permit(:name, :url, :video)
  end

end