class Jobposter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }

  serialize :roles, Array

  def root_admin?
    self.roles.include?('root')
  end

  def set_root
    self.roles << 'root' unless self.roles.include?('root')
  end

  def dis_root
    self.roles.delete('root') if self.roles.include?('root')
  end

  def approved?
    self.roles.include?('approved')
  end

  def approve
    self.roles << 'approved' unless self.roles.include?('approved')
  end

  def dis_approve
    self.roles.delete('approved') if self.roles.include?('approved')
  end

  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && (self.approved? || self.root_admin?)
  end
end
