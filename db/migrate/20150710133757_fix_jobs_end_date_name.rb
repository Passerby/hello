class FixJobsEndDateName < ActiveRecord::Migration
  def change
    rename_column :jobs, 'endDate', 'end_date'
  end
end
