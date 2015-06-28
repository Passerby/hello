class Company < ActiveRecord::Base
  belongs_to :jobposter
  has_many :jobs
end
