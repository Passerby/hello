class MyInfoController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def resumes
  end

  def applications
  end

  def favorites
    @favorite_jobs = FavoriteJob.eager_load(:job).where(user_id: current_user.id)
  end
end
