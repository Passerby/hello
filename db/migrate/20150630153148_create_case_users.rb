class CreateCaseUsers < ActiveRecord::Migration
  def change
    create_table :case_users do |t|
      t.string :name
      t.string :title
      t.string :company
      t.string :img
      t.text :content
      t.string :lang
      t.boolean :active

      t.timestamps null: false
    end
  end
end
