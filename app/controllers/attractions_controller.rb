class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def create_ride #creates a ride with user and attraction

    @attraction = Attraction.find_by(id: params[:id])
    if logged_in? && @attraction
      ride = @attraction.rides.build(:user_id => current_user.id)
      flash[:ride] = ride.take_ride
      ride.save
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create

    @attraction = Attraction.new(attraction_params)
    authorize @attraction
    if @attraction.save

      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    authorize @attraction
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end

  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :min_height, :tickets, :nausea_rating)
  end

end
