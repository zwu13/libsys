class SessionbooksController < ApplicationController
  def new
  end
  
  def create
    book = Book.find_by(isbn: params[:session][:isbn])
    if book
      click book
     redirect_to book
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def search
    @book = Book.search
  end
  
  def destroy
  
  end
  

end
