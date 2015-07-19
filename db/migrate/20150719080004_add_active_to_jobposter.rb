class AddActiveToJobposter < ActiveRecord::Migration
  def change
    add_column :jobposters, :active, :boolean, default: true
  end
end
