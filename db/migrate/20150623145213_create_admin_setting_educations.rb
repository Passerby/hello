class CreateAdminSettingEducations < ActiveRecord::Migration
  def change
    create_table :admin_setting_educations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
