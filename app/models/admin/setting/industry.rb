class Admin::Setting::Industry < ActiveRecord::Base
	has_many :admin_setting_job_titles
end
