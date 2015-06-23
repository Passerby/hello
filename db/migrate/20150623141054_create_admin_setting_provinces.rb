class CreateAdminSettingProvinces < ActiveRecord::Migration
  def change
    create_table :admin_setting_provinces do |t|
      t.string :name
      t.string :pinyin

      t.timestamps null: false
    end
  end
end
