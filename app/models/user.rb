class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :dojo

  def self.roles
  	["User", "Admin", "Super user"]
  end

  def self.ranks
  	["White", "Yellow", "Orange", "Green", "Blue", "Purple", "Brown", "Black", "Instructor"]
  end

  def active_for_authentication?
    super && self.active? # i.e. super && self.is_active
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end

end
