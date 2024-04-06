class BooksController < ApplicationController

  def new
    @book = Book.new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end
end
