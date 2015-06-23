class CreateAdminSettingIndustries < ActiveRecord::Migration
  def change
    create_table :admin_setting_industries do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
