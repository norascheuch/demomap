class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  belongs_to :event
end
