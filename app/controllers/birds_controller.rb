class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :edit, :update, :destroy]

  def index
    @bird_images = BirdImage.joins(:bird)
    # if params[:q]
      # @q = Bird.search(params[:q])
    # @birds = Bird.all.order(:species_id).page(params[:page]).per(6)
    @q = Bird.search(params[:q])
    @birds = @q.result.page(params[:page]).per(6)
    # if params[:search]
      # @birds = Bird.by_name(params[:search]).page(params[:page]).per(6)
    # elsif params[:q]
    # elsif

    # end
  end

  def show
    @bird_images = BirdImage.joins(:bird)
    @reviews = @bird.reviews.all_comments.page(params[:page]).per(6)
  end

  def new
    @bird = Bird.new
  end

  def edit; end

  def create
    @bird = Bird.new(bird_params)

    respond_to do |format|
      if @bird.save
        format.html { redirect_to @bird, notice: 'Bird was successfully created.' }
        format.json { render :show, status: :created, location: @bird }
      else
        format.html { render :new }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bird.update(bird_params)
        format.html { redirect_to @bird, notice: 'Bird was successfully updated.' }
        format.json { render :show, status: :ok, location: @bird }
      else
        format.html { render :edit }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bird.destroy
    respond_to do |format|
      format.html { redirect_to birds_url, notice: 'Bird was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:bird_name, :bird_info, :bird_price, :bird_voice, :species)
  end
end
