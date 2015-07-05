class Application < ActiveRecord::Base
	belongs_to :users
  	belongs_to :resumes
  	belongs_to :jobs
end
