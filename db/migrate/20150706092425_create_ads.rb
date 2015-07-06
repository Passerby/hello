class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :page
      t.string :img
      t.string :link

      t.timestamps null: false
    end
  end
end
