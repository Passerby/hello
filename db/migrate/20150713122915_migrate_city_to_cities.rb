class MigrateCityToCities < ActiveRecord::Migration
  def change
    Job.all.each do |job|
      if job.admin_setting_city_id.present?
        job.cities = [job.city]
        job.save
      end
    end
  end
end
