class ApplicationMailer < ActionMailer::Base
  default from: ENV['Mail_address']
  layout 'mailer'
end
