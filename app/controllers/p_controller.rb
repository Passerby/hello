class PController < ApplicationController
  def service
  end

  def case
  	@case_users = CaseUser.all
  end

  def about
  end

  def uptoken
  	put_policy = Qiniu::Auth::PutPolicy.new('testyune')
  	uptoken = Qiniu::Auth.generate_uptoken(put_policy)
  	render json: {uptoken: uptoken}
  end
end

