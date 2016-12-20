require 'uri'

class Shiba < ApplicationRecord
  
  has_many :matches
  has_many :votes
  has_many :voters, through: :votes, class_name: User
  belongs_to :creator
  belongs_to :matched_shiba, class_name: Shiba

  validates_presence_of :name, :url
  validates_uniqueness_of :name, scope: :url
  validates_format_of :url, with: /\A#{URI::regexp}\z/

end
