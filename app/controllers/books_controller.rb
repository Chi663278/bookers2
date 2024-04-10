class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
  @user = current_user
  @book = Book.new
  @books = Book.all
  end

  def show
    @other_book = Book.find(params[:id])
    @user = @other_book.user
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  # @book = current_user.books.new(book_params)   association （idの登録を記述しなくていい）
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private #ストロングパラメータbook_paramsを定義
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def is_matching_login_user
    book = Book.find(params[:id])
    user = User.find(book.user_id)
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
