class Job < ActiveRecord::Base
  attr_accessor :applications_count
  default_scope { where.not(active: false) }

  belongs_to :city, class_name: 'Admin::Setting::City', foreign_key: 'admin_setting_city_id'
  belongs_to :company
  belongs_to :jobposter

  has_many :applications
  has_many :job_cities
  has_many :cities, through: :job_cities
  has_many :job_industries
  has_many :industries, through: :job_industries

  validates :title, presence: true
  validates :salary, presence: true
  validates :company_id, presence: true
  # validates :admin_setting_city_id, presence: true
  # validates :cities, presence: true

  def self.search_city(city_id)
    if city_id.blank?
      all
    else
      eager_load(:job_cities).where(job_cities: { city_id: city_id })
    end
  end

  def self.search_industry(industry_id)
    if industry_id.blank?
      all
    else
      eager_load(:job_industries).where(job_industries: { industry_id: industry_id })
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