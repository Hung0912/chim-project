class AdminController < ApplicationController
  def index
    @total_bird = Bird.count
    @total_species = Species.count
    @total_user = User.count
    @total_review = Review.count
  end
end
