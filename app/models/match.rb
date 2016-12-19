class Match < ApplicationRecord

  belongs_to :creator, class_name: User
  belongs_to :shiba_one, class_name: Shiba
  belongs_to :shiba_two, class_name: Shiba
  has_one    :winner, class_name: Shiba
  has_one    :loser, class_name: Shiba

  validates_presence_of :creator, :shiba_one, :shiba_two
  validates_uniqueness_of :shiba_one, scope: 

end
