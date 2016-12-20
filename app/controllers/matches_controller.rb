class MatchesController < ApiController

  def index
    matches = Match.all
    render json: {status: 'Success', message: 'loaded all matches', data: matches}, status: :ok
  end

  def show
    match = Match.find_by(id: params[:id])
    if match
      render json: {status: 'Success', message: 'loaded a match', data: match}, status: :ok
    else
      render_error_json
    end
  end

  def create
    match = Match.new(match_params)
    if match.save
      render json: {status: 'Success', message: 'Created a match', data: match}, status: :ok
    else
      render json: {message: 'Error creating match', data: match.errors.full_messages}
    end
  end

  def destroy
    match = Match.find_by(id: params[:id])
    if match
      match.destroy
      render json: {status: 'Success', message: 'Match deleted'}, status: :ok
    else
      render_error_json
    end
  end

  private

  def match_params
    params.require(:match).permit(:shiba_one_id, :shiba_two_id, :creator_id)
  end

end