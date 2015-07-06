class LoginedController < ApplicationController
  def user
  	if user_signed_in?
  		render json: {logined: true}
  	else
  		render json: {logined: false}
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
