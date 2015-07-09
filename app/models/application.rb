class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :resume
  belongs_to :job

  after_create :auto_send_mail

  private

  def auto_send_mail
    # Send email to user
    ApplyMailer.post_user(self.user).deliver_later

    # Send email to job poster
    ApplyMailer.post_jobposter(self.job.jobposter).deliver_later
  end
end
