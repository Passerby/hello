class CreateCaseCompanies < ActiveRecord::Migration
  def change
    create_table :case_companies do |t|
      t.string :name
      t.string :img
      t.string :requirement
      t.string :usage
      t.string :effect
      t.string :lang
      t.boolean :active

      t.timestamps null: false
    end
  end
end
