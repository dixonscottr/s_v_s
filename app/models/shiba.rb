require 'uri'

class Shiba < ApplicationRecord
  
  has_many :votes
  has_many :voters, through: :votes, class_name: User
  belongs_to :creator, class_name: User
  # has_many :matched_shibas, class_name: Shiba

  validates_presence_of :name, :url
  validates_uniqueness_of :name, scope: :url
  validates_format_of :url, with: /\A#{URI::regexp}\z/

  def matches
    Match.where("shiba_one_id = ? OR shiba_two_id = ?", self.id, self.id)
  end

end
