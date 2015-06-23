class Admin::Setting::City < ActiveRecord::Base
	belongs_to :admin_setting_province, foreign_key: true
end
