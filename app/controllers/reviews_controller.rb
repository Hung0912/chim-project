class ReviewsController < ApplicationController
  before_action :find_bird, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @bird.reviews.all_comments.page(params[:page]).per(6)
  end

  def show; end

  def new
    @review = current_user.reviews.build
  end

  def edit; end

  def create
    @review = current_user.reviews.build(review_params)
    @review.bird_id = @bird.id
    if @review.save
      flash[:success] = "Thank you for your review."
      redirect_to :back
    else
      if @review.errors.any?
        flash[:warning] = "Comment and rating can't be blank."
      else
        flash[:warning] = "Some errors occured"
      end
      redirect_to @bird
    end

  end

  def update
    if @review.update_attributes(review_params)
      flash[:success] = "Your review has been updated."
      redirect_to :back
    else
      if @review.errors.any?
        flash[:warning] = "Comment and rating can't be blank."
      else
        flash[:warning] = "Some errors occured"
      end
      redirect_to :back
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find_by id: params[:id]
    return if @review
    redirect_to :back
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_bird
    @bird = Bird.find_by id: params[:bird_id]
    return if @bird
    redirect_to :back
  end

  def show_user_reviews
    @user_reviews = Review.where(user_id: current_user.id)
  end
end
