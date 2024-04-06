class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all

  end

  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  private #ストロングパラメータbook_paramsを定義
  def book_params
    params.require(:book).permit(:title, :caption, :image)
  end
end
