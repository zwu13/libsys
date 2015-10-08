class RecbooksController < ApplicationController
  def new
    @recbook = Recbook.new
  end
  
  def show
    @recbook = Recbook.find(params[:id])
  end
  
  def create
    @recbook = Recbook.new(recbook_params)
    if @recbook.save
      redirect_to @recbook
    else
      render 'new'
    end
  end
  
  def destroy
    Recbook.find(params[:id]).destroy
    redirect_to recbookslist_url
  end
  
  def index
    @recbooks = Recbook.all
  end
  
    def recbook_params
      params.require(:recbook).permit(:isbn, :title, :description, :author)
    end  
end
