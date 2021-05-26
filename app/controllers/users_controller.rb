class UsersController < ApplicationController
  protect_from_forgery

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @books = Book.all
  end

  def index
  end

  def edit
    @user = User.find(params[:id])

  end
end
