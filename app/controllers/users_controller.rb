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
    @user = User.find(params[:id])

  end
end
