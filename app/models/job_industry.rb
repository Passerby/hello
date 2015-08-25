class JobIndustry < ActiveRecord::Base
  belongs_to :job
  belongs_to :industry, class_name: 'Admin::Setting::Industry', foreign_key: 'industry_id'
end