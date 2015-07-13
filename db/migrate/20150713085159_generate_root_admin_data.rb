class GenerateRootAdminData < ActiveRecord::Migration
  def up
    Jobposter.create(email: ENV['ROOT_ADMIN_EMAIL'], password: ENV['ROOT_ADMIN_PASSWORD'], roles: ['approved', 'root'])
  end

  def down
    Jobposter.find_by(email: ENV['ROOT_ADMIN_EMAIL']).destroy
  end
end
