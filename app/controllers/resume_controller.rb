class ResumeController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :set_default]

  def index
    @resumes = Resume.all
  end

  def create

    @resume = Resume.new(resume_params)
    if user_signed_in?
      @resume.user_id = current_user.id
    end

      if @resume.save

        render json: {
        	"id": @resume.id,
        	"path": @resume.path
        }
     #   format.json { render :show, status: :created, location: @job }
      else
        render json: {"success": false}
      end
 
	end

  def destroy
    resume = Resume.find_by(id: params[:id], user_id: current_user.id)
    if resume.destroy
      render js: "location.reload();"
    else
      render js: "alert('delete resume job fail!');"
    end
  end

  def set_default
    resume = Resume.find_by(id: params[:id], user_id: current_user.id)
    if resume.present? && ( Resume.where(user_id: current_user.id).update_all(default: false) and resume.update(default: true))
      render js: "location.reload();"
    else
      render js: "alert('set default resume job fail!');"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:path, :user_id, :name)
    end

end
