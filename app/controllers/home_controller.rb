class HomeController < ApplicationController
  def index
    @birds = Bird.where(id:[19,20,21])
    @bird_images = BirdImage.joins(:bird)
  end
end
