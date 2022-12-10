class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
     @user = User.find(params[:id])
  end

  def show
    @user = current_user
    @books = @user.books
  end
end
