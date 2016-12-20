class VotesController < ApiController

  def index
    match = Match.find_by(id: params[:match_id])
    votes = match.votes
    loaded_all_resources_json("votes", votes)
  end

  def show
    vote = Vote.find_by(id: params[:id])
    match = Match.find_by(id: params[:match_id])
    if vote && match.votes.include?(vote)
      loaded_one_resource_json("vote", vote)
    else
      missing_resource_json
    end
  end

  def create
    vote = Vote.new(vote_params)
    match = Match.find_by(id: params[:match_id])
    vote.match = match
    if vote.save
      created_a_resource_json("vote", vote)
    else
      resource_not_saved_json(vote.errors.full_messages)
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id])
    if vote
      vote.destroy
      deleted_a_resource_json("vote")
    else
      missing_resource_json
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter_id, :shiba_id)
  end
  
end