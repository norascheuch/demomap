class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :demos
  has_many :permissions
  acts_as_voter

  before_create do |user|
    user.organizer = true
  end

end
