class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }

  validate :only_one_user
  before_save { email.downcase! }

  has_secure_password

  has_many :posts

  private
  def only_one_user
    errors[:base] << "You can't register more then one user!" unless User.count.zero?
  end
end
