class ApplyMailer < ApplicationMailer
  def post_user(user)
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'You applied a job')
  end

  def post_jobposter(jobposter)
    @url  = 'http://example.com/login'
    mail(to: jobposter.email, subject: 'Someone apply your job')
  end
end
