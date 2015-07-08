class AddParentToIndustry < ActiveRecord::Migration
  def change
    add_column :admin_setting_industries, :parent_id, :integer
  end
end
