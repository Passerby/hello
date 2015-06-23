class AddProvinceIdToCity < ActiveRecord::Migration
  def change
    add_column :admin_setting_cities, :admin_setting_province_id, :integer
  end
end
