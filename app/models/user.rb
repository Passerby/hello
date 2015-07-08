class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :resumes
  has_many :favorite_jobs
  validates :name, presence: true
  validates :tel, presence: true
  validates :job, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def hasResume
  	resumes = Resume.where(user_id: self.id).count
  	if resumes == 0
  		return false
  	else
  		return true
  	end
  end
end
