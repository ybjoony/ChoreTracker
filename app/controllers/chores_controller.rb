class ChoresController < ApplicationController
  before_filter :login_required, :except => :index 

  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def create
    @chore = Chore.new(params[:chore])
    if @chore.save
      redirect_to @chore, notice: 'Chore was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    @chore = Chore.find(params[:id])
    if @chore.update_attributes(params[:chore])
      redirect_to @chore, notice: 'Chore was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
  end
end
