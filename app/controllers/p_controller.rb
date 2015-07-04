class PController < ApplicationController
  def service
  end

  def case
#binding.pry
    if I18n.locale == :en
      lang = "en"
    else 
      lang = "cn"
    end
    
  	@case_users = CaseUser.where(lang: lang,active: true)
    @case_companies = CaseCompany.where(lang: lang, active: true)
    #Client.where('locked' => true)
  #  @user.email = ""
  #  email_with_name = "#{@user.name} <#{@user.email}>"
  #  email_with_name = "张云娥 <#{@user.email}>"
  #  ApplyMailer.welcome_email().deliver
  end

  def about
  end
end

