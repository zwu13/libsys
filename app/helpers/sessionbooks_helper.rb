module SessionbooksHelper
  def current_book
    @current_book ||= Book.find_by(id: session[:book_id])
  end
end
