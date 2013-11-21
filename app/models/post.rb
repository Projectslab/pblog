class Post < ActiveRecord::Base
  validates :title, :subject, :date, :user, presence: true

  belongs_to :user

  after_initialize { self.date ||= DateTime.current }

  def author
    user.name
  end
end
