class HomeController < ApplicationController
  def index

  	@jobs = Job.all
  	render layout: "home"
  end
end
