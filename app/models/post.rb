class Post < ActiveRecord::Base
  validates :title, :subject, :date, :user, presence: true

  belongs_to :user

  after_initialize { self.date ||= DateTime.current }
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  def author
    user.name
  end
end
