module SessionbooksHelper
  def book_value
    @book_value = params[:id]
  end

  def current_book
     @current_book ||= Book.find(session[:book_value])
  end
end
