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

  def self.search_city(city_id)
    if city_id.blank?
      all
    else
      where(admin_setting_city_id: city_id)
    end
  end

  def self.search(search_text)
    if search_text.blank?
      all
    else
      eager_load(:company).where("jobs.title LIKE ? OR jobs.description like ? OR jobs.salary like ? OR jobs.requirement like ? OR companies.name like ?",
       "%#{search_text}%",
       "%#{search_text}%",
       "%#{search_text}%",
       "%#{search_text}%",
       "%#{search_text}%")
    end
  end

end