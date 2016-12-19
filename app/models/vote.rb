class Vote < ApplicationRecord

  belongs_to :voter, class_name: User
  belongs_to :shiba
  belongs_to :match

  validates_presence_of :voter, :shiba, :match
  validates_uniqueness_of :voter, scope: :match

end
