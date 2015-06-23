class Job < ActiveRecord::Base
  belongs_to :admin_setting_city
  belongs_to :company
  belongs_to :jobposter
end
