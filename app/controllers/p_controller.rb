class PController < ApplicationController
  def service
  end

  def case
  	@case_users = CaseUser.all
    @case_companies = CaseCompany.all
  #  @user.email = ""
  #  email_with_name = "#{@user.name} <#{@user.email}>"
  #  email_with_name = "张云娥 <#{@user.email}>"
  #  ApplyMailer.welcome_email().deliver
  end

  def about
  end

  def uptoken
  	put_policy = Qiniu::Auth::PutPolicy.new('testyune')
  	uptoken = Qiniu::Auth.generate_uptoken(put_policy)
  	render json: {uptoken: uptoken}
  end
end

