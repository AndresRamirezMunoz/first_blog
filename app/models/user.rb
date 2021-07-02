class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Will return an array of follows for the given user instance
  # Devolverá un array de seguimientos para la instancia de usuario dada
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

  # Will return an array of users who follow the user instance
  # Devolverá un array de usuarios que siguen a la instancia de usuario
  has_many :followers, through: :received_follows, source: :follower

   #####################

  # returns an array of follows a user gave to someone else}
  # Devuelve un array de seguimientos que un usuario dio a otra persona
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"

  # returns an array of other users who the user has followed
  # devuelve un array de otros usuarios a los que el usuario ha seguido
  has_many :followings, through: :given_follows, source: :followed_user

end