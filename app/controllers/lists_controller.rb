class ListsController < ApplicationController

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
  end

end
