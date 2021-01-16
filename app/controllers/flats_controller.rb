class FlatsController < ApplicationController
  before_action :flat_find, only: [:edit, :update, :show, :destroy]

  def index
    @flats = Flat.all
  end
  
  def show
  end
  
  def edit
  end

  def update
    @flat.update(flat_params)
    if @flat.valid?
      @flat.save

      redirect_to flats_path
    else
      render :edit
    end
  end
  
  def destroy
    @flat.delete
    redirect_to flats_path
  end

  def new
    @flat = Flat.new()
  end

  def create
    flat = Flat.new(flat_params)
    if flat.valid?
      flat.save
      redirect_to flats_path
    else
      render :new
    end
  end
  
  private

  def flat_find
    @flat = Flat.find(params[:id])    
  end
  
  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
