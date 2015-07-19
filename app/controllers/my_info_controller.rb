class MyInfoController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def resumes
  end

  def applications
    @applications = Application.joins(:job).where(user_id: current_user.id)
  end

  def favorites
    @favorite_jobs = FavoriteJob.joins(:job).where(user_id: current_user.id)
  end
end
