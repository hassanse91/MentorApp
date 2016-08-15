class HomeController < ApplicationController
  def index
  	@mentors = Mentor.all
  end
end
