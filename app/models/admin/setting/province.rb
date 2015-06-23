class Admin::Setting::Province < ActiveRecord::Base
	has_many :admin_setting_cities
end
