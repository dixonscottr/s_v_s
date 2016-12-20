class Match < ApplicationRecord

  belongs_to    :creator, class_name: User
  belongs_to    :shiba_one, class_name: Shiba
  belongs_to    :shiba_two, class_name: Shiba
  belongs_to    :winner, class_name: Shiba
  belongs_to    :loser, class_name: Shiba
  has_many      :votes
  has_many      :voters, through: :votes, foreign_key: :voter_id

  validates_presence_of   :creator, :shiba_one, :shiba_two
  validate                :not_same_shiba

  def vote_count
    self.votes.count
  end

  private

  def not_same_shiba
    if shiba_one == shiba_two
      errors.add(:shibas, "A shiba cannot challenge itself")
    end
  end

end
