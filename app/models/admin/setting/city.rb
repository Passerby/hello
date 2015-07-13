class Admin::Setting::City < ActiveRecord::Base
  belongs_to :province, class_name: 'Admin::Setting::Province', foreign_key: 'admin_setting_province_id'
end
