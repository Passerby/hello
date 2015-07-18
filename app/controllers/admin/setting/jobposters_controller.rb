class Admin::Setting::JobpostersController < ApplicationController
  layout 'admin'

  before_action :auth_root_admin?

  def index
    @jobposters = Jobposter.all.order(id: :desc).page(params[:page])
  end

  def edit
    @jobposter = Jobposter.find(params[:id])
  end

  def update
    @jobposter = Jobposter.find(params[:id])
    if params[:approved] == 'yes'
      @jobposter.dis_approve
    end

    if params[:root_admin] == 'yes'
      @jobposter.set_root
    else
      @jobposter.dis_root
    end

    @jobposter.save

    redirect_to admin_setting_jobposters_url
  end

  private

  def auth_root_admin?
    redirect_to jobs_path unless current_jobposter.present? && current_jobposter.root_admin?
  end
end