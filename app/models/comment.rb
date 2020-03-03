class Comment < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true

end
