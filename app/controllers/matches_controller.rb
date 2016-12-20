class MatchesController < ApiController

  def index
    matches = Match.all
    loaded_all_resources_json('matches', matches)
  end

  def show
    match = Match.find_by(id: params[:id])
    if match
      loaded_one_resource_json('match', match)
    else
      missing_resource_json
    end
  end

  def create
    match = Match.new(match_params)
    if match.save
      created_a_resource_json("match", match)
    else
      resource_not_saved_json(match.errors.full_messages)
    end
  end

  def destroy
    match = Match.find_by(id: params[:id])
    if match
      match.destroy
      deleted_a_resource_json("match")
    else
      missing_resource_json
    end
  end

  private

  def match_params
    params.require(:match).permit(:shiba_one_id, :shiba_two_id, :creator_id)
  end

end