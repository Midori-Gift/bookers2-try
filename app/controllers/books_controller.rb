class BooksController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was created!"
      redirect_to books_path
    else
      @books = Book.all
      @new_book = Book.new(book_params)
      flash[:false] = "false Create book..."
      render :index
    end

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
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was update!"
      redirect_to book_path(@book.id)
    else
      render edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
