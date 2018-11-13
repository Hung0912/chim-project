class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin, :vip]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.user_role ||= :user
  end

  has_many    :reviews, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
