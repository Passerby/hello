class AddEnToSetting < ActiveRecord::Migration
  def change
#    add_column :admin_setting_cities, :en, :string
    add_column :admin_setting_educations, :en, :string
    add_column :admin_setting_experiences, :en, :string
    add_column :admin_setting_industries, :en, :string
    rename_column :admin_setting_cities, :pinyin, :en
    rename_column :admin_setting_provinces, :pinyin, :en
  end
end