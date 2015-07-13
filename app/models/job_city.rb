class JobCity < ActiveRecord::Base
  belongs_to :job
  belongs_to :city, class_name: 'Admin::Setting::City', foreign_key: 'city_id'
end
