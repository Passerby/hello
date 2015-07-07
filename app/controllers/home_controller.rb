class HomeController < ApplicationController
  def index
  	@jobs = Job.take(8)
  	@ad = Ad.where(page: 'hp').first
  	render layout: "home"
  end
end
