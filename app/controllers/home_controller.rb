class HomeController < ApplicationController
  def index
  	@jobs = Job.all
  	@ad = Ad.where(page: 'hp').first
  	render layout: "home"
  end
end
