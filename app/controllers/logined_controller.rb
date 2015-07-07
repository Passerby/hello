class LoginedController < ApplicationController
  def user
  	if user_signed_in?
      @application = Application.new
      @hasResume = User.find(current_user.id).hasResume
      @job_id = params[:job_id]
      render 'chooseResumeModal.js.erb'
  	#	render json: {logined: true}
  	else
      render 'loginModal.js.erb'
  	#	render json: {logined: false}
  	end
  end

  def jobposter
  	if jobposter_signed_in?
  		render json: {logined: true}
  	else
  		render json: {logined: false}
  	end
  end
end
