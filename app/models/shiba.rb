require 'uri'

class Shiba < ApplicationRecord
  
  has_many :votes
  has_many :voters, through: :votes, class_name: User
  belongs_to :creator, class_name: User

  validates_presence_of :name, :url
  validates_uniqueness_of :name, scope: :url
  validates_format_of :url, with: /\A#{URI::regexp}\z/

  def matches
    Match.where("shiba_one_id = ? OR shiba_two_id = ?", self.id, self.id)
  end

  def shibas_fought
    all_rivals = matches.map do |match|
      match.shiba_one == self ? match.shiba_two : match.shiba_one
    end
    all_rivals.uniq
  end

end
