class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end

  def list
  end
  
  def index
    @books = Book.all
  end
  
  def indexlib
    @books = Book.all
  end
  
  def access
    @book = Book.find_by(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  def addrecbook
    @book = Book.new(params[:book])
    if @book.save
      render 'edit'
    else
      render 'new'
    end
  end
  
  def search
    @book = Book.new;
    #redirect_to @book
  end
  
  def destroy
    Book.find(params[:id]).destroy
    redirect_to bookslist_url
  end
  
  private
  
    def suggested_book_params
      params.require(:book).permit(:isbn, :title, :description, :author)
    end
    def book_params
      params.require(:book).permit(:isbn, :title, :description, :author, :status)
    end
  
end
