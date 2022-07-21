class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # show user confirmation url on terminal
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def is?(role)
    self.role == role.to_s
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def authenticate(password)
    self.valid_password?(password)
  end
end
