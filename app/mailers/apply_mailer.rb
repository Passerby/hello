class ApplyMailer < ApplicationMailer



  def welcome_email()
    @url  = 'http://example.com/login'
    mail(to: "304328540@qq.com", subject: 'Welcome to My Awesome Site')
  end
end
