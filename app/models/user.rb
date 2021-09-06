class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :posts,
             :foreign_key => "users_id",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :request_received,
             :class_name => "FollowRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :requests_sent,
             :class_name => "FollowRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  # Indirect associations

  has_many   :follower,
             :through => :request_received,
             :source => :sender

  has_many   :following,
             :through => :requests_sent,
             :source => :recipient

  has_many   :likess,
             :through => :photos,
             :source => :likes

  has_many   :commentss,
             :through => :photos,
             :source => :comments

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
