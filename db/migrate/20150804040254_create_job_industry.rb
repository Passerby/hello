class CreateJobIndustry < ActiveRecord::Migration
  def change
    create_table :job_industries do |t|
      t.integer :job_id
      t.integer :industry_id
    end
  end
end