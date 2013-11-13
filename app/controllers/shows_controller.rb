class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    show_params = params.require(:show).permit(:name, :picture, :started_year, :episode_duration, :genre)
    @show = Show.find(params[:id])
    @success = @show.update_attributes show_params

    if @success
      redirect_to shows_path
    else
      head(:unprocessable_entity)
    end
  end

  def create
    show_params = params.require(:show).permit(:name, :picture)
    @show = Show.new(show_params)
    @success = @show.save

    if @success
      redirect_to shows_path
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    Show.destroy(params[:id])
    redirect_to root_path
  end

  def show
    @show = Show.find(params[:id])
  end
end