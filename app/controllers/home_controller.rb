class HomeController < ApplicationController
  def index
  	@jobs = Job.where(adjob: true).take(8)
  	@ad = Ad.where(page: 'hp').first
  	render layout: "home"
  end
end
