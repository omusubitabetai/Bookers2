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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully." 
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
