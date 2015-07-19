class AddStatusToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :status, :string, default: 'not_read'
  end
end
