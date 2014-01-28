class ChildrenController < ApplicationController
  before_filter :login_required
  
  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
  end

  def create
    @child = Child.new(params[:child])
    if @child.save
      redirect_to @child, notice: 'Child was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(params[:child])
      redirect_to @child, notice: 'Child was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
  end
end
