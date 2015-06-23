class CreateAdminSettingExperiences < ActiveRecord::Migration
  def change
    create_table :admin_setting_experiences do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
