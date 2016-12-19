class User < ApplicationRecord
  has_many :matches, foreign_key: :creator
  has_many :votes, foreign_key: :voter
  has_many :voted_for_shibas, through: :votes

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end
