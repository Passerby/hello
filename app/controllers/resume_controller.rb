class ResumeController < ApplicationController
  def index
  	@resumes = Resume.all
  end

  def create

    @resume = Resume.new(resume_params)


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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:path, :user_id)
    end

end
