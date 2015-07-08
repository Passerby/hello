class Admin::Setting::Industry < ActiveRecord::Base
	has_many :admin_setting_job_titles
  has_many :second_industries, class_name: "Admin::Setting::Industry", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Admin::Setting::Industry"

  def parent_name
    if self.parent_id.present?
      parent.name
    else
      '一级行业'
    end
  end
end
