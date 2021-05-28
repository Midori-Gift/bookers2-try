class UsersController < ApplicationController
  protect_from_forgery

  def show
    @users = User.find(params[:id])
    @book = @users.books
    @books = Book.all
    @new_book = Book.new

  end

  def index
    @users = current_user
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])

  end
end
