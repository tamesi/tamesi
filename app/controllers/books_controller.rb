class BooksController < ApplicationController
before_action :authenticate_user!
	def index
		@books = Book.all
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)
		else
			@books = Book.all
			render :index
		end
	end

	def edit
		   @book = Book.find(params[:id])
		if @book.user_id != current_user.id
		   flash[:notice] = "can't successfully access"
		   redirect_to user_path(@book.user_id)
	    end
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
    if  @book.save
		flash[:notice] = "Book was successfully update."
		redirect_to book_path(@book.id)
	else
		render 'edit'
	end
	end

	def show
		@book = Book.find(params[:id])
		@books = Book.new
		@user = @book.user
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to user_path(current_user.id)
	end


	private

	def book_params
		params.require(:book).permit(:title, :opinion)
	end
end

