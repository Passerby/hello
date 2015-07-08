class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :resume
  belongs_to :job

  after_create :auto_send_mail

  private

  def auto_send_mail
    SendMailJob.perform_later(self.id)
  end
end
