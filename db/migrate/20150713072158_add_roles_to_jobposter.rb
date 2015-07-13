class AddRolesToJobposter < ActiveRecord::Migration
  def change
    add_column :jobposters, :roles, :string, default: []
  end
end
