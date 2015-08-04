class AddAdjobToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :adjob, :boolean, :default => false
  end
end
