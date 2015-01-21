class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def index
    @bugs = Bug.all
  end

  def show
  end

  def new
    @bug = Bug.new
  end

  def edit
  end

  def create
    @bug = Bug.new(bug_params)
    if @bug.save
    	BugMailer.bug_email(@bug).deliver
    	#bugs are not being tracked by the system yet, hence the following line
    	@bug.destroy!
    	redirect_to root_path
    else
    	render action: "new"
    end
  end

  def update
    @bug.update(bug_params)
  end

  def destroy
    @bug.destroy
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:user, :description)
    end
end
