class VotesController < ApiController

  def index
    match = Match.find_by(id: params[:match_id])
    votes = match.votes
    render json: {status: 'Success', message: 'loaded all votes', data: votes}, status: :ok
  end

  def show
    vote = Vote.find_by(id: params[:id])
    if vote
      render json: {status: 'No resource', data: vote}
    else
      render_error_json
    end
  end

  def create
    vote = Vote.new(vote_params)
    match = Match.find_by(id: params[:match_id])
    vote.match = match
    if vote.save
      render json: {status: 'Success', message: 'Created a vote', data: vote}, status: :ok
    else
      render json: {message: 'Error creating vote', data: vote.errors.full_messages}
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:voter_id, :shiba_id)
  end
  
end