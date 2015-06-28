class Job < ActiveRecord::Base
  belongs_to :admin_setting_city
  belongs_to :company
  belongs_to :jobposter

  validates :title, presence: true
  validates :salary, presence: true
  validates :description, presence: true
  validates :requirement, presence: true
  validates :company_id, presence: true
  validates :admin_setting_city_id, presence: true

end