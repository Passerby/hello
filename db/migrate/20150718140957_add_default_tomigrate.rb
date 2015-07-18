class AddDefaultTomigrate < ActiveRecord::Migration
  def change
    add_column :resumes, :default, :boolean, default: false
  end
end
