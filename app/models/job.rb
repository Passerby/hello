class Job < ActiveRecord::Base
  belongs_to :admin_setting_city
  belongs_to :company
  belongs_to :jobposter

  validates :company_id, presence: true
  validates :admin_setting_city_id, presence: true

end
