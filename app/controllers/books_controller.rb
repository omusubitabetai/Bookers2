class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
      @book = Book.new(book_params)
      @book.user = current_user
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
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @users =@book.user
    @newbook = Book.new
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