class AddActiveToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :active, :boolean, default: true
  end
end
