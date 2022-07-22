class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many(:posts, dependent: :destroy)

  has_many(:friendships, class_name: "Friendship", foreign_key: "user_id", dependent: :destroy)
  has_many(:friends, through: :friendships, source: :recipient)

  has_many(:messages, dependent: :destroy)
  has_and_belongs_to_many(:dialogs)
end
