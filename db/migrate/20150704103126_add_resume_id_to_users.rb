class AddResumeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :resume_id, :string  #it's the last uploaded resume id
  end
end