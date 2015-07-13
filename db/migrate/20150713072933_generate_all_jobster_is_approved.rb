class GenerateAllJobsterIsApproved < ActiveRecord::Migration
  def change
    Jobposter.all.each do |job|
      job.roles << 'approved' unless job.roles.include?('approved')
      job.save
    end
  end
end
