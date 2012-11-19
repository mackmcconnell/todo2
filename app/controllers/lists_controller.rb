class ListsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    redirect_to lists_path if @list.save
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.active
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with @list
  end

  def deleted_tasks
    @list = List.find(params[:id])
    @tasks = @list.tasks.inactive
  end

end
