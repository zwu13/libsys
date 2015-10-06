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
#      render 'new'
    else
      render 'new'
    end
  end
  
    def recbook_params
      params.require(:recbook).permit(:isbn, :title, :description, :author)
    end  
end
