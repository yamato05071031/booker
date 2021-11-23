class BooksController < ApplicationController
  def home
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
      else
        render :index
      end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.' #詳細画面へ
      else
        @books = Book.all
        render action: :edit
      end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully"
  	redirect_to books_path
  end



  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
