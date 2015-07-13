class CreateJobCity < ActiveRecord::Migration
  def change
    create_table :job_cities do |t|
      t.integer :job_id
      t.integer :city_id
    end
  end
end
