class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin, :vip]
  after_initialize :set_default_role, :set_default_info, :if => :new_record?

  def set_default_info
    self.birthdate ||= '1996-1-1'
    self.sex ||= 'male'
    self.phone ||= '01234568'
  end

  def set_default_role
    self.user_role ||= :user
  end

  has_many    :reviews, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
