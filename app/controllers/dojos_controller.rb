class DojosController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  def index
    @dojos = Dojo.all    
  end

  def show
  end

  def new
    @dojo = Dojo.new
  end

  def edit
  end

  def create
    @dojo = Dojo.new(dojo_params)
    if @dojo.save
      redirect_to dojos_path
    end

  end

  def update
    @dojo.update(dojo_params)
  end

  def destroy
    @dojo.destroy
    redirect_to dojos_path
  end

  private
    def set_dojo
      @dojo = Dojo.find(params[:id])
    end

    def dojo_params
      params.require(:dojo).permit(:name)
    end
end
