class UsersController < ApplicationController
  def index
  	 @users = User.all
  #	 binding.pry
  	 @resumePath = Rails.application.config.resumePath
  	# Rails.application.config.resumePath
  	 render layout: "admin"
  end
end
