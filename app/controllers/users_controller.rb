class UsersController < ApplicationController
  before_action :authenticate_jobposter!, except: [:save_favorite_job, :delete_favorite_job]
  before_action :authenticate_user!, only: [ :delete_favorite_job]
  def index
    @users = initialize_grid(
      User,
      per_page: 20
    )
    #	binding.pry
    @resumePath = Rails.application.config.resumePath
    # Rails.application.config.resumePath
    render layout: "admin"
  end

  def save_favorite_job
    if current_user.present?
      FavoriteJob.find_or_create_by(user_id: current_user.id, job_id: params[:job_id])
   #   render js: "alert('收藏成功')" 
      render 'users/save_success.js.erb'
    else
      render 'logined/loginModal.js.erb'
   #   render js: "alert('请先登录')"
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
