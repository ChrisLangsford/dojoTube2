class DojosController < ApplicationController
  layout 'sidebar', only:  [:index]
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
    else
      render action: "new"
    end

  end

  def update
    if @dojo.update(dojo_params)
      redirect_to dojos_path
    else
      render action: "edit"
    end
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
