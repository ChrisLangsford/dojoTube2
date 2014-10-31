class AccountsController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
