class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "You have updated book successfully."
  else
    render :edit
  end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end