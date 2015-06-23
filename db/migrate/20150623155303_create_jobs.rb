class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :salary
      t.text :description
      t.text :requirement
      t.text :comment
      t.date :endDate
      t.references :admin_setting_city, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :jobposter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
