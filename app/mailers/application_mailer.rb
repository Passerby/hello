class ApplicationMailer < ActionMailer::Base
  default from: ENV['Mail_user_name']
  layout 'mailer'
end
