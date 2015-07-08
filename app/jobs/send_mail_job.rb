class SendMailJob < ActiveJob::Base
  queue_as :send_mail

  def perform(application_id)
    application = Application.find(application_id)
    if application.present?
      # Send email to user
      ApplyMailer.post_user(application.user).deliver_now

      # Send email to job poster
      ApplyMailer.post_jobposter(application.job.jobposter).deliver_now
    end
  end
end
