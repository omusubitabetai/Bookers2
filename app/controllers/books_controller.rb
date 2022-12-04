class BooksController < ApplicationController
  def edit
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @user =　User.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end