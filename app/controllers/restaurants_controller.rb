class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  # def destroy
  #   @task.destroy
  #   redirect_to tasks_path
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
