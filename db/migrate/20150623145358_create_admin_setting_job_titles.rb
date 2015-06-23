class CreateAdminSettingJobTitles < ActiveRecord::Migration
  def change
    create_table :admin_setting_job_titles do |t|
      t.string :name
      t.integer :admin_setting_industry_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
