class Job < ActiveRecord::Base
  attr_accessor :applications_count

  belongs_to :city, class_name: 'Admin::Setting::City', foreign_key: 'admin_setting_city_id'
  belongs_to :company
  belongs_to :jobposter

  has_many :applications

  validates :title, presence: true
  validates :salary, presence: true
  validates :description, presence: true
  validates :requirement, presence: true
  validates :company_id, presence: true
  validates :admin_setting_city_id, presence: true

end