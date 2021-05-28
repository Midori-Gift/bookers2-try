class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path

  end

  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:book, :title, :body)
  end

end
