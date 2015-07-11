class UsersController < ApplicationController
  before_action :authenticate_jobposter!, except: [:save_favorite_job, :delete_favorite_job]
  before_action :authenticate_user!, only: [:save_favorite_job, :delete_favorite_job]
  def index
  	 @users = User.all
  #	 binding.pry
  	 @resumePath = Rails.application.config.resumePath
  	# Rails.application.config.resumePath
  	 render layout: "admin"
  end

  def save_favorite_job
    if current_user.present?
      FavoriteJob.find_or_create_by(user_id: current_user.id, job_id: params[:job_id])
      render js: "alert('收藏成功')" 
    else
      render js: "alert('请先登录')"
    end
  end

  def delete_favorite_job
    favorite = FavoriteJob.find_by(user_id: current_user.id, job_id: params[:job_id])
    if favorite.destroy
      render js: "location.reload();"
    else
      render js: "alert('delete favorite job  fail!');"
    end
  end
end
