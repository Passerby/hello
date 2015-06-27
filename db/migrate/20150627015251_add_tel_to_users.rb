class AddTelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tel, :string
    add_column :users, :name, :string
    add_column :users, :job, :string

    add_column :users, :country, :string
    add_column :users, :admin_setting_education_id, :integer, foreign_key: true
    add_column :users, :admin_setting_experience_id, :integer, foreign_key: true
    add_column :users, :admin_setting_industry_id, :integer, foreign_key: true

#    add_column :users, :resume, :string
    add_column :users, :summmary, :text
  end
end
