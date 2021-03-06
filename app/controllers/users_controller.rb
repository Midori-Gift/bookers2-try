class UsersController < ApplicationController
  protect_from_forgery

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = @user.books
    @book_all = Book.all
    @new_book = Book.new

  end

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def edit
    @users = User.find(params[:id])
    @user = current_user
    if current_user != @users.id
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_iamge, :introduction)
  end

end
